# Usar a imagem oficial do Node.js
FROM node:18

# Configurar o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copiar os arquivos principais para instalar dependências
COPY package.json package-lock.json ./

# Instalar as dependências do projeto, incluindo react-router-dom
RUN npm install && npm install react-router-dom

# Copiar os arquivos restantes do projeto para o contêiner
COPY . .

# Expor a porta padrão do servidor de desenvolvimento React
EXPOSE 3000

# Rodar o servidor de desenvolvimento React
CMD ["npm", "start"]
