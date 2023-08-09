SELECT
  SUM(value) AS "valor",
  COUNT(value) AS "total",
  TYPE AS "tipo",
  to_char(transaction_at, 'YYYY-MM') AS "data"
FROM
  transactions
GROUP BY
  TYPE,
  transaction_at
HAVING
  TYPE = 'PAYMENT';