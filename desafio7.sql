select ar.artista, al.album, count(sa.FK_id_artista) as seguidores from SpotifyClone.artistas as ar 
inner join SpotifyClone.albuns as al
on al.FK_id_artista = ar.id_artista
inner join SpotifyClone.seguindo_artistas as sa
on  ar.id_artista = sa.FK_id_artista
group by al.album
order by seguidores desc, ar.artista, al.album
