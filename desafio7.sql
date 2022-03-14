select ar.artista as artista, al.album as album, count(sa.FK_id_artista) as seguidores from SpotifyClone.artistas as ar 
inner join SpotifyClone.albuns as al
on al.FK_id_artista = ar.id_artista
inner join SpotifyClone.seguindo_artistas as sa
on  ar.id_artista = sa.FK_id_artista
group by ar.artista, al.album
order by seguidores desc, artista, al.album
