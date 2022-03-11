select
convert(min(valor), decimal(5,2)) as faturamento_minimo,
convert(max(valor), decimal(5,2)) as faturamento_maximo,
convert(round(avg(valor), 2), decimal(5,2)) as faturamento_medio,
convert(sum(valor), decimal(5,2)) as faturamento_total from SpotifyClone.planos
inner join SpotifyClone.usuarios as us
on us.FK_id_plano = planos.id_plano
