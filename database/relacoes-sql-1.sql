-- Active: 1674045200354@@127.0.0.1@3306


-- Práticas = 1: muitos

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO users (id,name,email,password)
VALUES
    ('u001', 'Camilla', 'camilla@email.com','camilla123'),
    ('u002', 'Igor', 'igor@email.com', 'igorigor');


INSERT INTO phones (id,phone_number,user_id)
VALUES
    ('p001', '5514911111111', 'u001'),
    ('p002', '5561922222222', 'u001'),
    ('p003', '5533666665545', 'u002');


SELECT * FROM phones;

SELECT * FROM users;

DROP TABLE phones;

DROP TABLE users;



INSERT INTO phones (id,phone_number,user_id)
VALUES
    ('p004', '5514911111111', 'u003'); -- Não existe esse usuário

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;


-- Pratica 3 = 1:1

CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_name TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses (id)
);

INSERT INTO licenses (id, register_name, category)
VALUES
    ('l001', '1111111111111', 'A'),
    ('l002', '2222222222222', 'AB');

INSERT INTO drivers (id, name, email, password, license_id)
VALUES
    ('d001', 'Carlos Bergson', 'Carlosb@email.com', 'carlosbbb', 'l001'),
    ('d002', 'Heytor de Souza', 'heytor@email.com', 'heytorrrr', 'l002');


SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;



--Fixação

CREATE TABLE Marvel (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE Personagens (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    marvel_id TEXT NOT NULL,
    FOREIGN KEY (marvel_id) REFERENCES Marvel (id)
);

INSERT INTO Marvel (id, name)
VALUES
    ('01', 'Marvel');

INSERT INTO Personagens (id, name, marvel_id)
VALUES
    ('d001', 'Capitão América', '01'),
    ('d002', 'Homem de Ferro', '01'),
    ('d003', 'Pantera Negra', '01');


SELECT * FROM Personagens
INNER JOIN Marvel
ON Personagens.marvel_id = Marvel.id;

