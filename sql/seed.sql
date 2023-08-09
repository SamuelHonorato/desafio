DROP TABLE IF EXISTS banks CASCADE;

DROP TABLE IF EXISTS accounts CASCADE;

DROP TYPE IF EXISTS documents_enum CASCADE;

DROP TABLE IF EXISTS documents CASCADE;

DROP TABLE IF EXISTS transfers CASCADE;

DROP TYPE IF EXISTS transactions_enum CASCADE;

DROP TABLE IF EXISTS transactions CASCADE;

CREATE TABLE banks (
  id INT PRIMARY KEY,
  name VARCHAR (50) UNIQUE NOT NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE accounts (
  id INT PRIMARY KEY,
  agency VARCHAR (50) NOT NULL,
  account_number VARCHAR (50) NOT NULL,
  bank_id INT REFERENCES banks NOT NULL,
  created_at TIMESTAMP NOT NULL,
  UNIQUE (agency, account_number, bank_id)
);

CREATE TYPE documents_enum AS ENUM ('CPF');

CREATE TABLE documents (
  id INT PRIMARY KEY,
  TYPE DOCUMENTS_ENUM NOT NULL,
  value VARCHAR (50) NOT NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE transfers (
  id INT PRIMARY KEY,
  transfer_to INT REFERENCES accounts NOT NULL,
  document_id INT REFERENCES documents NOT NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE TYPE transactions_enum AS ENUM (
  'WITHDRAW',
  'DEPOSIT',
  'TRANSFER_SENT',
  'TRANSFER_RECEIVED',
  'PAYMENT'
);

CREATE TABLE transactions (
  id INT PRIMARY KEY,
  TYPE TRANSACTIONS_ENUM NOT NULL,
  value INT NOT NULL,
  transaction_at TIMESTAMP NOT NULL,
  transaction_group VARCHAR (50) NOT NULL,
  transfer_id INT REFERENCES transfers,
  account_id INT REFERENCES accounts NOT NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE INDEX idx_transactions ON transactions(type, transaction_at);

INSERT INTO
  banks(id, name, created_at)
VALUES
  (1, 'Banco do Brasil', NOW());

INSERT INTO
  accounts(id, agency, account_number, created_at, bank_id)
VALUES
  (1, '1', '1', NOW(), 1);

INSERT INTO
  accounts(id, agency, account_number, created_at, bank_id)
VALUES
  (2, '2', '2', NOW(), 1);

INSERT INTO
  documents(id, TYPE, value, created_at)
VALUES
  (1, 'CPF', '14284200020', NOW());

INSERT INTO
  transfers(id, transfer_to, document_id, created_at)
VALUES
  (1, 2, 1, NOW());

INSERT INTO
  transactions(
    id,
    TYPE,
    value,
    transaction_at,
    transaction_group,
    transfer_id,
    account_id,
    created_at
  )
VALUES
  (
    1,
    'PAYMENT',
    1000,
    '2023-01-01 00:00:00',
    '1',
    NULL,
    1,
    NOW()
  );

INSERT INTO
  transactions(
    id,
    TYPE,
    value,
    transaction_at,
    transaction_group,
    transfer_id,
    account_id,
    created_at
  )
VALUES
  (
    2,
    'PAYMENT',
    2000,
    '2023-02-01 00:00:00',
    '2',
    NULL,
    1,
    NOW()
  );

INSERT INTO
  transactions(
    id,
    TYPE,
    value,
    transaction_at,
    transaction_group,
    transfer_id,
    account_id,
    created_at
  )
VALUES
  (
    3,
    'PAYMENT',
    3000,
    '2023-03-01 00:00:00',
    '3',
    NULL,
    1,
    NOW()
  );

INSERT INTO
  transactions(
    id,
    TYPE,
    value,
    transaction_at,
    transaction_group,
    transfer_id,
    account_id,
    created_at
  )
VALUES
  (
    4,
    'PAYMENT',
    4000,
    '2023-04-01 00:00:00',
    '4',
    NULL,
    2,
    NOW()
  );

INSERT INTO
  transactions(
    id,
    TYPE,
    value,
    transaction_at,
    transaction_group,
    transfer_id,
    account_id,
    created_at
  )
VALUES
  (
    5,
    'PAYMENT',
    5000,
    '2023-05-01 00:00:00',
    '5',
    NULL,
    2,
    NOW()
  );

INSERT INTO
  transactions(
    id,
    TYPE,
    value,
    transaction_at,
    transaction_group,
    transfer_id,
    account_id,
    created_at
  )
VALUES
  (
    6,
    'PAYMENT',
    5000,
    '2023-05-01 00:00:00',
    '6',
    NULL,
    2,
    NOW()
  );

  INSERT INTO
  transactions(
    id,
    TYPE,
    value,
    transaction_at,
    transaction_group,
    transfer_id,
    account_id,
    created_at
  )
VALUES
  (
    7,
    'TRANSFER_SENT',
    9000,
    '2023-10-01 00:00:00',
    'foo',
    1,
    1,
    NOW()
  );

INSERT INTO
  transactions(
    id,
    TYPE,
    value,
    transaction_at,
    transaction_group,
    transfer_id,
    account_id,
    created_at
  )
VALUES
  (
    8,
    'TRANSFER_RECEIVED',
    9000,
    '2023-10-01 00:00:00',
    'foo',
    1,
    2,
    NOW()
  );
