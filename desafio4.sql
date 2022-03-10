select us.usuario, if(max(year(hp.data_reproducao)) = 2021, 'Usuário ativo', 'Usuário inativo') as condicao_usuario
from SpotifyClone.usuarios as us
inner join historico_de_reproducoes as hp
on hp.FK_id_usuario = us.id_usuario
group by us.usuario
order by us.usuario;