CREATE TABLE
    IF NOT EXISTS accounts(
        id VARCHAR(255) NOT NULL primary key COMMENT 'primary key',
        createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
        updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
        name varchar(255) COMMENT 'User Name',
        email varchar(255) COMMENT 'User Email',
        picture varchar(255) COMMENT 'User Picture'
    ) default charset utf8 COMMENT '';

CREATE TABLE
    hotdogs(
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR (500),
        imgUrl VARCHAR(1000),
        bun VARCHAR(500),
        dog VARCHAR(500),
        hasKetchup BOOLEAN,
        hasMustard BOOLEAN,
        description VARCHAR(1000),
        expirationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
        price DOUBLE
    );

DROP TABLE hotdogs;

INSERT INTO
    hotdogs (
        name,
        imgUrl,
        bun,
        dog,
        hasKetchup,
        hasMustard,
        description,
        price
    )
VALUES (
        'Huge Dog',
        'https://images.unsplash.com/photo-1619740455993-9e612b1af08a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        'Huge Toasted Whole Wheat',
        'Kosher Veggie Polish',
        true,
        false,
        '-mungus',
        45
    );

INSERT INTO
    hotdogs (
        name,
        imgUrl,
        bun,
        dog,
        hasKetchup,
        hasMustard,
        description,
        price
    )
VALUES (
        'Danger Dog',
        'https://images.unsplash.com/photo-1619740455993-9e612b1af08a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        'Extra Spicy Jalapeno',
        'Extra Spicy Chorizo',
        false,
        true,
        'Chorizo dog in a loaded jalapeno covered in hot mustard and horse-radish',
        15
    );

INSERT INTO
    hotdogs (
        name,
        imgUrl,
        bun,
        dog,
        hasKetchup,
        hasMustard,
        description,
        price
    )
VALUES (
        'Slim Dog',
        'https://images.unsplash.com/photo-1619740455993-9e612b1af08a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        'Petite Brioche',
        'Regular sized frank',
        true,
        true,
        'Pretty much a plain ol dog',
        5
    );

SELECT * FROM hotdogs;

SELECT name, price
FROM hotdogs
WHERE
    `hasKetchup` = true
    AND price < 6;

SELECT name, price
FROM hotdogs
WHERE
    name LIKE '%mustard%'
    OR description LIKE '%mustard%';

SELECT name, price FROM hotdogs ORDER BY price DESC;

SELECT name, price FROM hotdogs LIMIT 2 OFFSET 1;

SELECT price, name FROM hotdogs ORDER BY price WHERE price < 30;

SELECT * FROM hotdogs WHERE id = 1;

DELETE FROM hotdogs WHERE id = 5;

DELETE FROM hotdogs ORDER BY price DESC LIMIT 1;

UPDATE hotdogs SET price = 20 WHERE id = 1;

UPDATE hotdogs SET price = price /2 WHERE price > 5;

-- END OF DEMO

-- START OF GREGSLIST

CREATE TABLE
    cars(
        id INT AUTO_INCREMENT PRIMARY KEY,
        make ENUM(
            'toya',
            'bww',
            'goblin-car',
            'egg'
        ) NOT NULL COMMENT "These are car models that exist in Mick-land",
        model VARCHAR(255) NOT NULL,
        imgUrl VARCHAR(500) DEFAULT 'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        price INT NOT NULL,
        year INT NOT NULL,
        description VARCHAR(1000),
        isNew BOOLEAN DEFAULT false
    ) default charset utf8mb4 COMMENT 'supports emojis';

INSERT INTO
    cars (make, model, year, price, isNew)
VALUES (
        'toya',
        'yoda',
        1998,
        4000,
        false
    );

INSERT INTO
    cars (make, model, year, price, isNew)
VALUES (
        'goblin-car',
        'knee-exploder',
        2002,
        800,
        true
    );

INSERT INTO
    cars (make, model, year, price, isNew)
VALUES (
        'bww',
        'subaru',
        1993,
        10000,
        false
    );

SELECT * FROM cars;

SELECT * FROM cars WHERE id = LAST_INSERT_ID();

SELECT LAST_INSERT_ID();

-- HOUSES

CREATE TABLE
    houses(
        id INT AUTO_INCREMENT PRIMARY KEY,
        year INT NOT NULL,
        color VARCHAR(100),
        bedrooms VARCHAR(255) NOT NULL,
        bathrooms VARCHAR(255) NOT NULL,
        city VARCHAR(100),
        state VARCHAR(100),
        price INT NOT NULL,
        isNew BOOLEAN DEFAULT false,
        description VARCHAR(1000),
        imgUrl VARCHAR(500) DEFAULT 'https://images.unsplash.com/photo-1639166250201- c3361df84e19? ixlib = rb -4.0.3 & ixid = M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA % 3 D % 3 D & auto = format & fit = crop & w = 1286 & q = 80'
    ) default charset utf8 COMMENT '';

INSERT INTO
    houses (
        year,
        color,
        bedrooms,
        bathrooms,
        city,
        state,
        price,
        isNew,
        description,
        imgUrl
    )
VALUES (
        '1942',
        'blue',
        4,
        1,
        'bozeman',
        'montana',
        500000,
        false,
        'old historical ranch house',
        'https:/ages.unsplash.com/oto-649197373372-c8e2093bf7?lib=-.0.3&id=wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%to=rmat&t=op&70&80'
    );

INSERT INTO
    houses (
        year,
        color,
        bedrooms,
        bathrooms,
        city,
        state,
        price,
        isNew,
        description,
        imgUrl
    )
VALUES (
        '1976',
        'yellow',
        4,
        1,
        'bozeman',
        'montana',
        12000,
        false,
        'another old historical ranch house',
        'https: / / images.unsplash.com / photo -1506140006527 -5 ca84877d824 ? ixlib = rb -4.0.3 & ixid = M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA % 3 D % 3 D & auto = format & fit = crop & w = 2699 & q = 80'
    );

SELECT * FROM houses;

SELECT * FROM houses WHERE id = LAST_INSERT_ID();

SELECT LAST_INSERT_ID();