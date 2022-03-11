SELECT us.usuario, count(hp.FK_id_musica) as qtde_musicas_ouvidas, ROUND((sum(mu.duracao)/60),2) as total_minutos
FROM SpotifyClone.usuarios as us
INNER JOIN SpotifyClone.historico_de_reproducoes as hp
ON us.id_usuario = hp.FK_id_usuario 
INNER JOIN SpotifyClone.musicas as mu
ON mu.id_musica = hp.FK_id_musica
group by us.usuario;
