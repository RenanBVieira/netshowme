# Use a imagem oficial do Node.js
FROM node:18

# Configure o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copie o arquivo package.json e package-lock.json (se existir)
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie o restante dos arquivos do projeto para o contêiner
COPY . .

# Exponha a porta padrão do React (3000)
EXPOSE 3000

# Comando para rodar o servidor de desenvolvimento do React
CMD ["npm", "start"]
