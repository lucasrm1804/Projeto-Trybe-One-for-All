select mu.musica as cancao, count(mu.musica) as reproducoes from SpotifyClone.historico_de_reproducoes as hp
inner join SpotifyClone.musicas as mu
on id_musica = hp.FK_id_musica
group by cancao
order by reproducoes desc, cancao
limit 2;
