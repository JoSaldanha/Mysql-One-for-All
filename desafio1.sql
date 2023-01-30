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
      duration INT NOT NULL,
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
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.Albums (artist_id, album_name, release_year)
  VALUES
    (1, 'Renaissance', 2022),
    (2, '.Jazz', 1978),
    (2, 'Hot Space', 1982),
    (3, 'Falso Brilhante', 1998),
    (3, 'Vento de Maio', 2001),
    (4, 'QVVJFA?', 2003),
    (5, 'Somewhere Far Beyond?', 2007),
    (6, 'I Put A Spell On You', 2012);

  INSERT INTO SpotifyClone.Musics (artist_id, album_id, music_name, duration)
  VALUES
    (1, 1, 'BREAK MY SOUL', 279),
    (1, 1, 'VIRGO’S GROOVE', 369),
    (1, 1, 'ALIEN SUPERSTAR', 116),
    (2, 2, 'Don’t Stop Me Now', 203),
    (2, 3, 'Under Pressure', 152),
    (3, 4, 'Como Nossos Pais', 105),
    (3, 5, 'O Medo de Amar é o Medo de Ser Livre', 207),
    (4, 6, 'Samba em Paris', 267),
    (5, 7, 'The Bard’s Song', 244),
    (6, 8, 'Feeling Good', 100);

  INSERT INTO SpotifyClone.Following_artists (user_id, artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2 ,1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

  INSERT INTO SpotifyClone.Playback (user_id, music_id, playback_date)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');
