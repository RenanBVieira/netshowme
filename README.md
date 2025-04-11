## Teste técnico Netshow.me

Bem vindo ao back-end da área de membros com vídeos da Netshow.me!

## Sobre o projeto

Esse projeto foi criado com contêinerização em Docker e usando Laravel v12.x (PHP 8.2).

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
```

Logo em seguida, dentro da pasta raiz netshowme_backend, rode os comandos abaixo para a construção do seu contêiner:
```bash
  docker-compose up --build
```

Em outra aba do terminal, execute o comando abaixo para rodar o servidor dentro do seu contêiner:
```bash
  docker exec -it netshowme_app bash
```
