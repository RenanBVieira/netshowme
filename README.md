## Teste técnico Netshow.me

Bem vindo a área de membros com vídeos da Netshow.me!

## Sobre o projeto

Esse projeto foi criado com contêinerização em Docker, usando Laravel v12.x (PHP 8.2) no back-end e React no front-end.

O sistema operacional utilizado foi o ElementaryOS, baseado no Ubuntu, portanto ele será a nossa referência de instalação de componentes e utilitários.

## Instalação

Instale o Github:
```bash
  sudo apt-get install git
```

Instale o Docker:
```bash
  sudo apt-get install docker-compose
```

## Configuração 

Baixe o repositório na sua máquina:
```bash
  git clone [nome-projeto]
  cd [nome-projeto]
```

### Configuração das variáveis de ambiente do Laravel

Crie um arquivo de configuração:
```bash
  cd backend
  cp .env-example .env
```

Dentro desse arquivo .env, configure as variáveis abaixo para acesso ao banco de dados:
```bash
  DB_CONNECTION=mysql
  DB_HOST=db
  DB_PORT=3306
  DB_DATABASE=netshowme_backend
  DB_USERNAME=seu_usuario
  DB_PASSWORD=sua_senha
```

### Configuração das variáveis de ambiente do React

Crie um arquivo de configuração:
```bash
  cd backend
  cp .env-example .env
```

Dentro desse arquivo .env, insira a linha abaixo para configurar a rota de chamada da api:
```bash
  REACT_APP_API_BASE_URL=http://localhost:8000/api
```
### Configuração do Docker

Logo em seguida, dentro da pasta raiz netshowme, rode o comando abaixo para a construção do seu contêiner:
```bash
  docker-compose up --build
```

## Rotas (opcional)

Para testar o funcionamento das rotas, você também poderá tentar acessar as url's abaixo.

O back-end em Laravel deverá estar sendo executado na URL abaixo:
```bash
  http://0.0.0.0:8000/
``` 

O front-end em React deverá estar sendo executado na URL abaixo:
```bash
  http://localhost:3000/
```

## Testes 

Para efetuar a cobertura de testes do back-end e do front-end, você também poderá rodar os comandos abaixo.

Primeiro, para checar o back-end:
```bash
  docker exec -it netshowme_app bash
  php artisan test
```

Por fim, para checar o front-end:
```bash
  docker exec -it netshowme_frontend bash
  npm test
```