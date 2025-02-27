import os
import json
import pandas as pd
import psycopg2

# Configuração do banco de dados (alterar conforme necessário)
DB_CONFIG = {
 'dbname': 'meu_enem_db',         # Nome do banco de dados
 'user': 'meu_enem_user',         # Usuário do banco de dados
 'password': 'meu_enem_password', # Senha do banco de dados
 'port': 5433,                    # Porta do banco de dados
 'host': 'localhost'              # Host do banco de dados
}

# Caminhos do CSV e do diretório de JSONs (alterar conforme necessário)
CSV_PATH = r"C:\Users\joao_\Downloads\microdados_enem_2010\DADOS\ITENS_PROVA_2010.csv"
JSON_DIR = r"C:\Code\tcc\enem-api\public\2010\questions"

# Lista de CO_PROVA (alterar conforme necessário)
CO_PROVA_LIST = [85, 89, 95, 99]

# Função para conectar ao banco de dados
def connect_to_db():
 return psycopg2.connect(**DB_CONFIG)

# Função principal para processar os dados
def process_questions(csv_path, json_dir, co_prova_list):
 # Conectar ao banco de dados
 conn = connect_to_db()
 cursor = conn.cursor()

 print(f"Conectado ao banco: {DB_CONFIG['dbname']} em {DB_CONFIG['host']}:{DB_CONFIG['port']}")

 # Carregar o CSV com delimitador e codificação corretos
 df = pd.read_csv(csv_path, delimiter=';', encoding='ISO-8859-1')

 # Filtrar apenas CO_PROVA na lista fornecida e IN_ITEM_ABAN != 1
 df = df[df['CO_PROVA'].isin(co_prova_list) & (df['IN_ITEM_ABAN'] != 1)]
 
 # Iterar sobre cada linha do CSV
 for _, row in df.iterrows():
     co_posicao = row['CO_POSICAO']
     sg_area = row['SG_AREA']
     co_item = row['CO_ITEM']
     tx_gabarito = row['TX_GABARITO']
     co_habilidade = row['CO_HABILIDADE']
     nu_param_a = row['NU_PARAM_A']
     nu_param_b = row['NU_PARAM_B']
     nu_param_c = row['NU_PARAM_C']
     co_prova = row['CO_PROVA']
     tp_lingua = row['TP_LINGUA']

     # Tratar TP_LINGUA: se for NaN, definir como NULL
     if pd.isna(tp_lingua):
         tp_lingua = None

     # Validar TP_LINGUA (garantir que seja 0, 1 ou NULL)
     if tp_lingua not in [0, 1, None]:
         print(f"Valor inválido para TP_LINGUA: {tp_lingua}. Pulando questão.")
         continue

     # Determinar a pasta correta com base no index e na língua
     folder_name = f"{co_posicao}"
     if tp_lingua == 0:  # Inglês
         folder_name = f"{co_posicao}-ingles"
     elif tp_lingua == 1:  # Espanhol
         folder_name = f"{co_posicao}-espanhol"

     json_path = os.path.join(json_dir, folder_name, "details.json")

     # Verificar se o arquivo JSON existe
     if not os.path.exists(json_path):
         print(f"Arquivo JSON não encontrado para CO_POSICAO {co_posicao}")
         continue

     # Carregar o JSON
     with open(json_path, 'r', encoding='utf-8') as f:
         details = json.load(f)

     # Verificar se o index do JSON corresponde ao CO_POSICAO
     if details['index'] != co_posicao:
         print(f"Index do JSON ({details['index']}) não corresponde ao CO_POSICAO ({co_posicao})")
         continue

     # Extrair o campo `files` da questão
     question_files = details.get('files', [])
     question_file = question_files[0] if question_files else None  # Pega o primeiro arquivo, se existir

     # Debug: Exibir os dados antes de inserir
     print(f"Inserindo questão: CO_POSICAO={co_posicao}, TP_LINGUA={tp_lingua}, FILE={question_file}")

     try:
         # Inserir a questão na tabela `questoes`
         cursor.execute("""
             INSERT INTO questoes (
                 co_item, title, index, year, context, correct_alternative, alternatives_intro,
                 nu_param_a, nu_param_b, nu_param_c, co_prova, tp_lingua, habilidade_id, area_conhecimento_id, file
             ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 
                       (SELECT id FROM areas_conhecimento WHERE abreviacao = %s), %s)
             RETURNING id
         """, (
             co_item, details['title'], details['index'], details['year'], details['context'],
             details['correctAlternative'], details['alternativesIntroduction'], nu_param_a, nu_param_b,
             nu_param_c, co_prova, tp_lingua, co_habilidade, sg_area, question_file
         ))
         questao_id = cursor.fetchone()[0]

         # Inserir as alternativas na tabela `alternativas`
         for alt in details['alternatives']:
             alternative_file = alt.get('file', None)  # Pega o arquivo associado à alternativa, se existir
             cursor.execute("""
                 INSERT INTO alternativas (questao_id, letra, texto, file, is_correct)
                 VALUES (%s, %s, %s, %s, %s)
             """, (
                 questao_id, alt['letter'], alt['text'], alternative_file, alt['isCorrect']
             ))

         print(f"Questão {co_posicao} inserida com sucesso!")

     except psycopg2.Error as e:
         print(f"Erro ao inserir questão {co_posicao}: {e}")
         conn.rollback()  # Reverter transação em caso de erro
         continue

 # Confirmar transações no banco de dados
 conn.commit()
 cursor.close()
 conn.close()

if __name__ == "__main__":
 # Executar o processamento
 process_questions(CSV_PATH, JSON_DIR, CO_PROVA_LIST)