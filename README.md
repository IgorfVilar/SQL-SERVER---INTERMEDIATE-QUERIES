# SQL-SERVER---INTERMEDIATE-QUERIES

Queries de nível intermediário feitas no Microsoft SQL Server com o Banco de dados
NYC Taxi disponibilizado no site da Microsoft.
Download: https://learn.microsoft.com/en-us/sql/machine-learning/tutorials/demo-data-nyctaxi-in-sql?view=sql-server-ver17

CONSULTA 1: Resumo mensal por tipo de pagamento

Cria um resumo mensal com base na data do embarque (pickup_datetime), agrupado por:
- mês (yyyy-MM)
- tipo de pagamento (payment_type)

🧩 Funções utilizadas
- FORMAT() — formata a data para "ano-mês".
- SUM() — soma valores numéricos.
- CASE WHEN — cria uma coluna com classificação.
- GROUP BY — agrupa por mês e tipo de pagamento.
- ORDER BY DESC — ordena do mês mais recente para o mais antigo.
-----------------------------------------------

CONSULTA 2: Métricas por Vendedor (Vendor)
- Calcula estatísticas por empresa fornecedora (vendor_id).

🧩 Funções utilizadas
- AVG() — média de tempo, distância e passageiros.
- SUM() — soma o valor total arrecadado pela vendor.
- GROUP BY vendor_id — agrupa por empresa.
- HAVING — filtra grupos (diferente de WHERE).
- Aqui ela retorna somente vendors cujo número médio de passageiros é menor ou igual a 2.
-----------------------------------------------

CONSULTA 3: Percentual de contribuição mensal
- Calcula o percentual que cada mês representa do faturamento total.

🧩 Funções utilizadas
- SUM() — soma por mês.
- Window Function: SUM() OVER()
- Calcula o total geral da soma dos meses.
- FORMAT() — formata a data.
-----------------------------------------------

CONSULTA 4: Acumulado mensal (Running Total)
- CTE (Common Table Expression) calcula o total de cada mês.
- A query principal calcula o acumulado mês a mês.

🧩 Funções utilizadas
- CTE (WITH …) — facilita organização.
- SUM() — soma valores mensais.
- Window Function SUM() OVER (ORDER BY MONTHS) — cria o acumulado crescente.
-----------------------------------------------

CONSULTA 5: Criação de uma VIEW
- Cria uma VIEW chamada PERFORMANCE contendo exatamente o mesmo resultado da Query 1.

🧩 Funções utilizadas
- CREATE VIEW — cria uma tabela lógica que pode ser consultada depois.
- FORMAT(), SUM(), CASE WHEN, GROUP BY — mesmo comportamento da Query 1.



