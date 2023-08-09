SELECT
  to_char(transaction_at, 'MM/YY') AS "Data",
  SUM(value) AS "Valor",
  COUNT(value) AS "Transacoes",
  TYPE AS "Tipo"
FROM
  transactions
GROUP BY
  TYPE,
  transaction_at
HAVING
  TYPE = 'PAYMENT';