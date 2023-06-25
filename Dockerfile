# Define a imagem base
FROM ruby:2.6.1

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o Gemfile e o Gemfile.lock para o contêiner
COPY Gemfile Gemfile.lock ./

# Instala as dependências da aplicação
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copia o restante dos arquivos da aplicação para o contêiner
COPY . .

# Define o comando a ser executado quando o contêiner for iniciado
CMD ["ruby", "lib/encrypted_field.rb"]
