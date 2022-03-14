select ar.artista, al.album from SpotifyClone.artistas as ar 
inner join SpotifyClone.albuns as al
on al.FK_id_artista = ar.id_artista
where artista = 'Walter Phoenix'