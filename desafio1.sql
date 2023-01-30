DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;
  
  CREATE TABLE SpotifyClone.Subscription_plan(
      plan_id INT NOT NULL AUTO_INCREMENT,
      plan VARCHAR(25) NOT NULL,
      price INT,
      PRIMARY KEY (plan_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.Users(
      user_id INT NOT NULL AUTO_INCREMENT,
      user_name VARCHAR(255) NOT NULL,
      user_age INT,
      plan_id INT,
      signature_date DATE NOT NULL,
      PRIMARY KEY (user_id),
      FOREIGN KEY (plan_id) REFERENCES Subscription_plan(plan_id)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.Artists(
      artist_id INT NOT NULL AUTO_INCREMENT,
      artist VARCHAR(255) NOT NULL,
      PRIMARY KEY (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.Following_artists(
      user_id INT,
      artist_id INT,
      FOREIGN KEY (user_id) REFERENCES Users(user_id),
      FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
      CONSTRAINT PRIMARY KEY(user_id, artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.Albums(
      album_id INT NOT NULL AUTO_INCREMENT,
      artist_id INT,
      album_name VARCHAR(255) NOT NULL,
      release_year YEAR NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
      PRIMARY KEY (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.Musics(
      music_id INT NOT NULL AUTO_INCREMENT,
      artist_id INT,
      album_id INT,
      music_name VARCHAR(255) NOT NULL,
      PRIMARY KEY (music_id),
      FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
      FOREIGN KEY (album_id) REFERENCES Albums(album_id)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.Playback(
      user_id INT,
      music_id INT,
      playback_date DATETIME NOT NULL,
      FOREIGN KEY (user_id) REFERENCES Users(user_id),
      FOREIGN KEY (music_id) REFERENCES Musics(music_id),
      CONSTRAINT PRIMARY KEY(user_id, music_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.Subscription_plan (plan, price)
  VALUES
    ('gratuito', 0.00),
    ('pessoal', 6.99),
    ('universitário', 5.99),
    ('familiar', 7.99);

  INSERT INTO SpotifyClone.Users (user_name, user_age, plan_id, signature_date)
  VALUES
    ('Barbara Liskov', 82, 3, '2019-10-20'),
    ('Robert Cecil Martin', 58, 4, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 3, '2017-01-17'),
    ('Sandi Metz', 58, 1, '2018-04-29'),
    ('Paulo Freire', 19, 1, '2018-02-14'),
    ('Bell Hooks', 26, 1, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 2, '2020-05-13'),
    ('Jorge Amado', 58, 2, '2017-02-17');

  INSERT INTO SpotifyClone.Artists (artist)
  VALUES
    ('Manoel Gomes'), ('Costa Gold'),
    ('Sabaton'), ('System Of A Down'),
    ('Edson Gomes'), ('Mundo Bita');

  INSERT INTO SpotifyClone.Albums (artist_id, album_name, release_year)
  VALUES
    (1, 'Caneta Azul', 2020),
    (2, '.155', 2015),
    (2, 'AUGE', 2021),
    (3, 'The Last Stand', 2016),
    (3, 'The Great War', 2019),
    (4, 'Toxicity', 2001),
    (5, 'Apocalipse', 1997),
    (6, 'Bita e os Animais', 2014);

  INSERT INTO SpotifyClone.Musics (artist_id, album_id, music_name)
  VALUES
    (1, 1, 'Caneta Azul'),
    (1, 1, 'Aniversário'),
    (2, 2, 'N.A.D.A.B.O.M 2'),
    (2, 2, 'Dás Arábia'),
    (2, 3, 'N.A.D.A.B.O.M 3'),
    (3, 4, 'The Last Stand'),
    (3, 5, 'The Red Baron'),
    (4, 6, 'Toxicity'),
    (5, 7, 'Fogo na Babilônia'),
    (6, 8, 'Fazendinha');

  INSERT INTO SpotifyClone.Following_artists (user_id, artist_id)
  VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1),
    (10, 1),
    (6, 5),
    (3, 4),
    (10, 2),
    (2, 6);

  INSERT INTO SpotifyClone.Playback (user_id, music_id, playback_date)
  VALUES
    (1, 1, "2022-08-05 08:05:17"),
    (2, 1, "2021-04-15 08:45:10"),
    (3, 1, "2020-12-28 18:24:17"),
    (4, 1, "2021-06-18 07:11:55"),
    (5, 1, "2021-03-09 12:32:20"),
    (6, 1, "2022-03-05 14:19:10"),
    (7, 1, "2020-11-17 10:12:26"),
    (8, 1, "2022-06-06 17:45:11"),
    (9, 1, "2021-04-15 09:15:33"),
    (10, 1, "2021-10-04 18:45:10"),
    (6, 9, "2012-03-17 14:56:41"),
    (3, 8, "2017-01-24 00:31:17"),
    (10, 8, "2011-09-21 10:33:27"),
    (7, 5, "2022-06-06 17:45:11"),
    (5, 7, "2022-06-07 19:45:16"),
    (2, 10, "2021-10-07 20:32:10");
