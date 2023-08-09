# Desafio

## Instalação
Na pasta raiz do projeto executar:
```
docker compose up -d
docker cp sql desafio_db:/
docker compose run desafio_app mix deps.get
```

## Seed no Banco de dados
```
docker exec -it desafio_db psql -U postgres -a -q -f sql/seed.sql
```

## Query no Banco de dados
```
docker exec -it desafio_db psql -U postgres -a -q -f sql/query.sql
```

## Credenciais do Banco de dados
- Usuário: postgres
- Senha: 12345
- Banco de dados: postgres
- Porta: 5455

## Executar teste no projeto Elixir
```
docker compose run desafio_app mix test
```

## Critérios de Aceite

- Não trabalhe com valores com decimais. Ou seja, ponto flutuante ou float. Use inteiros para representar os valores! Como a menor unidade na nossa moeda é o centavo, use valores inteiros em centavos. Assim, um real será representado por 100 (cem centavos é igual a um real).

- Divida o valor de forma igual! Por exemplo, um valor total de 102 (R$ 1,02) para ser dividido entre 4 e-mails. O final deve ser duas pessoas com 26 e duas pessoas com 25. `test/helpers/calculate_helper_test.exs:36`

- Quando fizer a divisão, é importante que não falte nenhum centavo! Cuidado quando tiver, por exemplo, um valor total de 100 (R$ 1,00) para ser dividido entre 3 e-mails. Isso daria uma dízima infinita. No entanto, o correto aqui é que duas pessoas fiquem com o valor 33 e uma fique com 34. `test/helpers/calculate_helper_test.exs:43`

- Mantenha a representação de valores em números inteiros até o fim, ou seja, os valores finais não devem ser representados ou convertidos para números de ponto flutuante. `test/calculate_test.exs:4`

- O resultado da função deve ser um mapa/dicionário. Em javascript essas estruturas de dados são conhecidas como objetos. `test/calculate_test.exs:4`

- Escreva testes unitários para verificar as validações de e-mails duplicados, listas vazias e total maior que zero. `test/validates/list_people_validate_test.exs:21`

- Escreva testes unitários para verificar os cenários possíveis de divisão. Como o valor total de 100 para 3 pessoas, de 102 para 4 pessoas e o de 1 para 3 pessoas. `test/helpers/calculate_helper_test.exs:35`

- Não trabalhe com arquivos, apenas envie para a função as duas listas.

- Deixe documentado como você executa os testes unitários da solução. Por exemplo: "Eu instalo a versão X da linguagem, eu compilo o código com o comando Y e executo os testes unitários com o comando Z".
