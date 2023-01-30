SELECT COUNT(DISTINCT t1.music_id) AS cancoes,
COUNT(DISTINCT t2.artist_id) AS artistas,
COUNT(DISTINCT t3.album_id) AS albuns
FROM SpotifyClone.Musics AS t1
INNER JOIN SpotifyClone.Artists AS t2
INNER JOIN SpotifyClone.Albums AS t3;