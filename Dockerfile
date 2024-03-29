# Use a imagem base do Python
FROM python:3

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Instala o Gunicorn
RUN pip install gunicorn

# Copia o restante do código fonte para o diretório de trabalho
COPY . .

# Exponha a porta em que o Gunicorn irá escutar
EXPOSE 8000

# Comando para iniciar o Gunicorn e executar o aplicativo Flask
CMD ["gunicorn", "-b", "0.0.0.0:8000", "main:app"]
