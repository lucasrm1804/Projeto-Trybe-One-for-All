SELECT 
(SELECT COUNT(*) FROM SpotifyClone.musicas) as cancoes,
(SELECT COUNT(*) FROM SpotifyClone.artistas) as artistas,
(SELECT COUNT(*) FROM SpotifyClone.albuns) as albuns;
