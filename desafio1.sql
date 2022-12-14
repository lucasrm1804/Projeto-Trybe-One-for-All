drop database if exists SpotifyClone;

create database SpotifyClone;

CREATE TABLE SpotifyClone.planos (
  id_plano INTEGER PRIMARY KEY AUTO_INCREMENT,
  plano CHAR(20) NOT NULL,
  valor DOUBLE(5, 2)
) engine=InnoDB;

CREATE TABLE SpotifyClone.usuarios (
  id_usuario INTEGER PRIMARY KEY AUTO_INCREMENT,
  usuario VARCHAR(31) NOT NULL,
  idade TINYINT NOT NULL,
  FK_id_plano INTEGER NOT NULL,
  FOREIGN KEY (FK_id_plano) REFERENCES planos (id_plano),
  data_assinatura DATETIME
) engine=InnoDB;

CREATE TABLE SpotifyClone.artistas (
  id_artista INTEGER PRIMARY KEY AUTO_INCREMENT,
  artista VARCHAR(50) NOT NULL
) engine=InnoDB;

CREATE TABLE SpotifyClone.albuns (
  id_album INTEGER PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(50) NOT NULL,
  ano YEAR NOT NULL,
  FK_id_artista INTEGER NOT NULL,
  FOREIGN KEY (FK_id_artista) REFERENCES artistas (id_artista)
) engine=InnoDB;

CREATE TABLE SpotifyClone.musicas (
  id_musica INTEGER PRIMARY KEY AUTO_INCREMENT,
  musica VARCHAR(50) NOT NULL,
  duracao INTEGER NOT NULL,
  FK_id_artista INTEGER NOT NULL,
  FK_id_album INTEGER NOT NULL,
  FOREIGN KEY (FK_id_artista) REFERENCES artistas (id_artista),
  FOREIGN KEY (FK_id_album) REFERENCES albuns (id_album)
) engine=InnoDB;

CREATE TABLE SpotifyClone.seguindo_artistas (
  FK_id_artista INTEGER NOT NULL,
  FK_id_usuario INTEGER NOT NULL,
  FOREIGN KEY (FK_id_artista) REFERENCES artistas (id_artista),
  FOREIGN KEY (FK_id_usuario) REFERENCES usuarios (id_usuario),
  PRIMARY KEY (FK_id_artista, FK_id_usuario)
) engine=InnoDB;

CREATE TABLE SpotifyClone.historico_de_reproducoes (
  data_reproducao DATETIME NOT NULL, 
  FK_id_usuario INTEGER NOT NULL,
  FK_id_musica INTEGER NOT NULL,
  FOREIGN KEY (FK_id_usuario) REFERENCES usuarios (id_usuario),
  FOREIGN KEY (FK_id_musica) REFERENCES musicas (id_musica),
  PRIMARY KEY (FK_id_usuario, FK_id_musica)
) engine=InnoDB;

INSERT INTO SpotifyClone.planos (plano, valor)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitario', 5.99),
('pessoal', 6.99);

INSERT INTO SpotifyClone.usuarios (usuario, idade, data_assinatura, FK_id_plano)
VALUES
('Thati', 23, '2019-10-20', 1),
('Cintia', 35, '2017-12-30', 2),
('Bill', 20, '2019-06-05', 3),
('Roger', 45, '2020-05-13', 4),
('Norman', 58, '2017-02-17', 4),
('Patrick', 33, '2017-01-06', 2),
('Vivian', 26, '2018-01-05', 3),
('Carol', 19, '2018-02-14', 3),
('Angelina', 42, '2018-04-29', 2),
('Paul', 46, '2017-01-17', 2);

INSERT INTO SpotifyClone.artistas (artista)
VALUES
("Walter Phoenix"),
("Peter Strong"),
("Lance Day"),
("Freedie Shannon"),
("Tyler Isle"),
("Fog");

INSERT INTO SpotifyClone.albuns (album, ano, FK_id_artista)
VALUES
('Envious',1990,1),
('Exuberant',1993,1),
('Hallowed Steam',1995,2),
('Incandescent',1998,3),
('Temporary Culture',2001,4),
('Library of liberty',2003,4),
('Chained Down',2007,5),
('Cabinet of fools',2012,5),
('No guarantees',2015,5),
('Apparatus',2015,6);

INSERT INTO SpotifyClone.musicas(musica, duracao, FK_id_artista, FK_id_album)
VALUES
("Soul For Us",200,1,1),
("Reflections Of Magic",163,1,1),
("Dance With Her Own",116,1,1),
("Troubles Of My Inner Fire",203,1,2),
("Time Fireworks",152,1,2),
("Magic Circus",105,2,3),
("Honey, So Do I",207,2,3),
("Sweetie, Let's Go Wild",139,2,3),
("She Knows",244,2,3),
("Fantasy For Me",100,3,4),
("Celebration Of More",146,3,4),
("Rock His Everything",223,3,4),
("Home Forever",231,3,4),
("Diamond Power",241,3,4),
("Let's Be Silly",132,3,4),
("Thang Of Thunder",240,4,5),
("Words Of Her Life",185,4,5),
("Without My Streets",176,4,5),
("Need Of The Evening",190,4,6),
("History Of My Roses",222,4,6),
("Without My Love",111,4,6),
("Walking And Game",123,4,6),
("Young And Father",197,4,6),
("Finding My Traditions",179,5,7),
("Walking And Man",229,5,7),
("Hard And Time",135,5,7),
("Honey, I'm A Lone Wolf",150,5,7),
("She Thinks I Won't Stay Tonight",166,5,8),
("He Heard You're Bad For Me",154,5,8),
("He Hopes We Can't Stay",210,5,8),
("I Know I Know",117,5,8),
("He's Walking Away",159,5,9),
("He's Trouble",138,5,9),
("Heard I Want To Bo Alone",120,5,9),
("I Ride Alone",151,5,9),
("Honey",79,6,10),
("You Cheated On Me",95,6,10),
("Wouldn't It Be Nice",213,6,10),
("Baby",136,6,10),
("You Make Me Feel So..",83,6,10);

INSERT INTO SpotifyClone.seguindo_artistas(FK_id_artista, FK_id_usuario)
VALUES
(1,1),
(4,1),
(3,1),
(1,2),
(3,2),
(2,3),
(1,3),
(4,4),
(5,5),
(6,5),
(6,6),
(3,6),
(1,6),
(2,7),
(5,7),
(1,8),
(5,8),
(6,9),
(4,9),
(3,9),
(2,10),
(6,10);

INSERT INTO SpotifyClone.historico_de_reproducoes(FK_id_usuario, FK_id_musica, data_reproducao)
VALUES
(1,36,"2020-02-28 10:45:55"),
(1,25,"2020-05-02 05:30:35"),
(1,23,"2020-03-06 11:22:33"),
(1,14,"2020-08-05 08:05:17"),
(1,15,"2020-09-14 16:32:22"),
(2,34,"2020-01-02 07:40:33"),
(2,24,"2020-05-16 06:16:22"),
(2,21,"2020-10-09 12:27:48"),
(2,39,"2020-09-21 13:14:46"),
(3,6,"2020-11-13 16:55:13"),
(3,3,"2020-12-05 18:38:30"),
(3,26,"2020-07-30 10:00:00"),
(4,2,"2021-08-15 17:10:10"),
(4,35,"2021-07-10 15:20:30"),
(4,27,"2021-01-09 01:44:33"),
(5,7,"2020-07-03 19:33:28"),
(5,12,"2017-02-24 21:14:22"),
(5,14,"2020-08-06 15:23:43"),
(5,1,"2020-11-10 13:52:27"),
(6,38,"2019-02-07 20:33:48"),
(6,29,"2017-01-24 00:31:17"),
(6,30,"2017-10-12 12:35:20"),
(6,22,"2018-05-29 14:56:41"),
(7,5,"2018-05-09 22:30:49"),
(7,4,"2020-07-27 12:52:58"),
(7,11,"2018-01-16 18:40:43"),
(8,39,"2018-03-21 16:56:40"),
(8,40,"2020-10-18 13:38:05"),
(8,32,"2019-05-25 08:14:03"),
(8,33,"2021-08-15 21:37:09"),
(9,16,"2021-05-24 17:23:45"),
(9,17,"2018-12-07 22:48:52"),
(9,8,"2021-03-14 06:14:26"),
(9,9,"2020-04-01 03:36:00"),
(10,20,"2017-02-06 08:21:34"),
(10,21,"2017-12-04 05:33:43"),
(10,12,"2017-07-27 05:24:49"),
(10,13,"2017-12-25 01:03:57");
