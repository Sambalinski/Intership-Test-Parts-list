USE test;

DROP TABLE IF EXISTS part;
CREATE TABLE part
(
  id     INT                  NOT NULL AUTO_INCREMENT,
  name   VARCHAR(100)         NOT NULL,
  needed TINYINT(1) DEFAULT 0 NOT NULL,
  quantity INT(4)               NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO part (name, needed, quantity)
VALUES ('коробка', 1, 10),
       ('материнская плата', 1, 5),
       ('процессор', 1, 4),
       ('блок питания', 1, 7),
       ('видеокарта', 0, 3),
       ('монитор', 0, 6),
       ('клавиатура', 0, 4),
       ('подсветка корпуса', 0, 8),
       ('оперативная память', 1, 9),
       ('HDD диск', 1, 14),
       ('звуковая карта', 0, 6),
       ('мышь', 0, 8),
       ('card reader', 0, 6),
       ('CD привод', 0, 7),
       ('DVD привод', 0, 5),
       ('TV тюнер', 0, 9),
       ('куллер', 1, 8),
       ('blu-ray привод', 0, 3),
       ('джойстик', 0, 6),
       ('балон с сжатым воздухом', 0, 9),
       ('коврик', 0, 20),
       ('геймпад', 0, 5);