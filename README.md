
```markdown
# Consultas SQL para Análise de Transações de Usuários

Este repositório contém consultas SQL para realizar análises nas transações de usuários em um banco de dados.
Abaixo estão as consultas disponíveis juntamente com suas descrições:

## Consulta 1: Quanto tempo em média os usuários demoram entre o primeiro e segundo depósito

Esta consulta calcula o tempo médio que os usuários demoram entre o primeiro e o segundo depósito.
```

```sql
select 
  SEC_TO_TIME(avg(tr.dif)) as media
from(
select 
        TIME_TO_SEC(timediff(date_format((
           select min(t2.created_at)
           from transactions t2
           inner join wallets on 
                wallets.id = t2.wallet_id
            inner join users us2 on
                us2.id = wallets.user_id
            where 
            	t2.created_at > transactions.created_at and
                us2.id = users.id
            group by
    		users.id
        ), '%H:%i:%s'),
        date_format(min(transactions.created_at),'%H:%i:%s'))) as dif
from 
    transactions 
inner join wallets on 
    wallets.id = transactions.wallet_id
inner join users on
    users.id = wallets.user_id
group by 
   users.id
) as tr
```

## Consulta 2: Quanto tempo em média os usuários demoram entre o terceiro e quarto depósito

Esta consulta calcula o tempo médio que os usuários demoram entre o terceiro e o quarto depósito.

```sql
--
select SEC_TO_TIME(AVG(tr.dif)) as media
from
(select       
 
  TIME_TO_SEC(timediff(
   date_format(min(t4.created_at),'%H:%i:%s'),
   date_format(min(t3.created_at),'%H:%i:%s')
  )) as dif
from 
    transactions 
inner join wallets on 
    wallets.id = transactions.wallet_id
inner join users on
    users.id = wallets.user_id
left join (
   select transactions.created_at,
          wallets.user_id,
          transactions.id
   from transactions
   inner join wallets on 
        wallets.id = transactions.wallet_id
) as t2 on 
   t2.created_at >= transactions.created_at and
   t2.user_id = users.id and
   t2.id != transactions.id
   
left join (
   select transactions.created_at,
          wallets.user_id,
          transactions.id
   from transactions
   inner join wallets on 
        wallets.id = transactions.wallet_id
) as t3 on 
   t3.created_at >= t2.created_at and
   t3.user_id = users.id and
   t3.id != transactions.id and
   t3.id != t2.id
   
left join (
   select transactions.created_at,
          wallets.user_id,
          transactions.id
   from transactions
   inner join wallets on 
        wallets.id = transactions.wallet_id
) as t4 on 
   t4.created_at >= t3.created_at and
   t4.user_id = users.id and
   t4.id != transactions.id and
   t4.id != t3.id
group by 
   users.id) AS tr
```

## Consulta 3: Qual o valor médio do segundo depósito?

Esta consulta calcula o valor médio do segundo depósito realizado pelos usuários.

```sql
--
select AVG(tr.amount) as media
from
(select       
  t2.amount
from 
    transactions 
inner join wallets on 
    wallets.id = transactions.wallet_id
inner join users on
    users.id = wallets.user_id
left join (
   select transactions.created_at,
          wallets.user_id,
          transactions.id,
          transactions.amount
   from transactions
   inner join wallets on 
        wallets.id = transactions.wallet_id
) as t2 on 
   t2.created_at >= transactions.created_at and
   t2.user_id = users.id and
   t2.id != transactions.id
   
group by 
   users.id) AS tr
```

## Consulta 4: Quantos usuários fizeram o terceiro depósito mas não fizeram o quarto?

Esta consulta identifica quantos usuários realizaram o terceiro depósito, mas não efetuaram o quarto depósito.

```sql
--
select sum(t.id) as total
from (
select       
  count(distinct users.id) as id
from 
    transactions 
inner join wallets on 
    wallets.id = transactions.wallet_id
inner join users on
    users.id = wallets.user_id
left join (
   select transactions.created_at,
          wallets.user_id,
          transactions.id
   from transactions
   inner join wallets on 
        wallets.id = transactions.wallet_id
) as t2 on 
   t2.created_at >= transactions.created_at and
   t2.user_id = users.id and
   t2.id != transactions.id
   
left join (
   select transactions.created_at,
          wallets.user_id,
          transactions.id
   from transactions
   inner join wallets on 
        wallets.id = transactions.wallet_id
) as t3 on 
   t3.created_at >= t2.created_at and
   t3.user_id = users.id and
   t3.id != transactions.id and
   t3.id != t2.id
   
left join (
   select transactions.created_at,
          wallets.user_id,
          transactions.id
   from transactions
   inner join wallets on 
        wallets.id = transactions.wallet_id
) as t4 on 
   t4.created_at >= t3.created_at and
   t4.user_id = users.id and
   t4.id != transactions.id and
   t4.id != t3.id
group by 
   users.id
having
 count(distinct t4.id) = 0 and 
 count(distinct t3.id) > 0 ) as t
```

## Consulta 5: Quantos usuários criados no mês de agosto fizeram o primeiro e segundo depósito?

Esta consulta conta quantos usuários criados no mês de agosto realizaram tanto o primeiro quanto o segundo depósito.

```sql
--
select sum(t.id) as total
from (
select       
  count(distinct users.id) as id,
  users.created_at
from 
    transactions 
inner join wallets on 
    wallets.id = transactions.wallet_id
inner join users on
    users.id = wallets.user_id
left join (
   select transactions.created_at,
          wallets.user_id,
          transactions.id
   from transactions
   inner join wallets on 
        wallets.id = transactions.wallet_id
) as t2 on 
   t2.created_at >= transactions.created_at and
   t2.user_id = users.id and
   t2.id != transactions.id
where
   month(users.created_at) = 8 
group by 
   users.id
having
   count(distinct transactions.id) > 0 and 
   count(distinct t2.id) > 0
) as t

