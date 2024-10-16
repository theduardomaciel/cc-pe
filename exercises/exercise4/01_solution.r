# 1. O volume de correspondência recebido por uma firma quinzenalmente tem distribuição
# normal com média de 4.000 cartas e desvio padrão de 200 cartas.
# Qual a Porcentagem de quinzenas em que a firma recebe:
#   a. Entre 3.600 e 4.250 cartas?
#   b. Menos de 3.400 cartas?
#   c. Mais de 4.636 cartas?

# a) P(3600 < X < 4250) = F(4250) - F(3600)
v1 <- pnorm(4250, mean = 4000, sd = 200) - pnorm(3600, mean = 4000, sd = 200)
cat("a) P(3600 < X < 4250) =", round(v1, digits = 2) * 100, "%\n")

# b) P(X < 3400) = F(3400)
v2 <- pnorm(3400, mean = 4000, sd = 200)
cat("b) P(X < 3400) =", round(v2, digits = 2) * 100, "%\n")

# c) P(X > 4636) = 1 - F(4636)
v3 <- 1 - pnorm(4636, mean = 4000, sd = 200)
# ou: pnorm(4636, mean = 4000, sd = 200, lower.tail = FALSE)
cat("c) P(X > 4636) =", round(v3, digits = 2) * 100, "%\n")

# 2. Uma enchedora automática de refrigerantes está regulada para que o volume médio de
# líquido em cada garrafa seja de 1000 cm3 e desvio padrão de 10 cm3. Admita que o volume
# siga uma distribuição normal.
#   a.  Qual é a porcentagem de garrafas em que o volume de líquido é menor que 990 cm3?
#   b.  Qual é a porcentagem de garrafas em que o volume de líquido não se desvia da média
#       em mais do que dois desvios padrões?
#   c.  Se 10 garrafas são selecionadas ao acaso, qual é a probabilidade de que, no máximo, 4
#       tenham volume de líquido superior a 1002 cm3?

# a) P(X < 990) = F(990)
v1 <- pnorm(990, mean = 1000, sd = 10)
cat("a) Em ", round(v1, digits = 2) * 100, "% das garrafas o volume de líquido é menor que 990cm^3\n")

# b) P(980 < X < 1020) = F(1020) - F(980)
v2 <- pnorm(1020, mean = 1000, sd = 10) - pnorm(980, mean = 1000, sd = 10)
cat("b) Em aproximadamente ", round(v2, digits = 2) * 100, "% das garrafas, o volume de líquido não se desvia da média em mais que
dois desvios padrões. \n")

#

# 3. Em um certo teste de aptidão para contratação de determinada empresa, os candidatos
# devem realizar uma sequência de tarefas no menor tempo possível. Suponhamos que o
# tempo necessário para completar esse teste tenha uma distribuição Normal com média 45
# minutos e desvio-padrão de 20 minutos. Suponhamos que, numa primeira etapa, esse teste
# foi aplicado com uma amostra de 50 candidatos.
#   a.  Qual a probabilidade de encontrarmos algum candidato que tenha um tempo
#       superior a 50 minutos ou inferior a 30 minutos?
#   b.  Qual o número aproximado de candidatos com tal perfil?

# 4. Uma máquina produz discos de diâmetro médio de 2 cm com desvio padrão de 0,01 cm. As
# peças que se afastam por mais de 0,03 cm desse valor médio são consideradas com defeito.
# Qual o percentual de peças consideradas defeituosas?

# 5. A vida média de uma marca de televisão é de 8 anos com desvio padrão de 1,8 anos. A
# campanha de lançamento diz que todos os produtos que tiverem defeito dentro do prazo
# de garantia serão trocados por novos. Se você fosse o gerente de produção, qual seria o
# tempo de garantia que você especificaria para ter no máximo 5% de trocas?
# 1.

# 6. Suponha que, em determinado período do dia, o tempo médio de atendimento em um
# caixa de banco seja de 5 minutos. Admitindo que o tempo para atendimento tenha
# distribuição exponencial, determinar a probabilidade de um cliente:
# a) esperar mais do que 5 minutos;
# b) esperar menos do que 4 minutos;
# c) esperar entre 3 e 8 minutos.

# 7. Os dados de uma pesquisa mostram algumas informações sobre o tempo de cirurgias para
# reconstrução ACL em hospitais com alto volume de cirurgia. A partir dos dados foram
# calculados, o tempo médio de 129 minutos com um desvio padrão de 14 minutos.
# a) Qual é a probabilidade de uma cirurgia ACL, em um hospital com alto volume de
# cirurgias, requerer um tempo maior do que dois desvios-padrão acima da média?
# b) Qual é a probabilidade de uma cirurgia ACL, em um hospital com alto volume de
# cirurgias ser completada em menos de 100 minutos?
# c) Em qual tempo a probabilidade de uma cirurgia ACL em um hospital com alto volume
# de cirurgias é igual a 0.95?
# d) Se uma cirurgia requer 199 minutos, o que você conclui sobre o volume de tais cirurgias
# em um hospital? Explique

# 8. Um fabricante de baterias, sabe que sua fabricação tem vida média de 600 dias e desvio
# padrão de 100 dias, e que tem distribuição normal. Oferece uma garantia de 312 dias, ou
# seja, troca as baterias se apresentarem falhas nesse período. Fábrica 10.000 baterias
# mensalmente. Quantas deverá trocar pelo uso da garantia, mensalmente?

# 9. Sabe-se que os pacotes de queijo ralado vendido em supermercado possuem distribuição
# normal com média 100 g e desvio padrão de 10 g.
# a. Qual a probabilidade de encontrar um pacote com peso no intervalo de 95g e 105 g?
# b. Se 16 pacotes são escolhidos ao acaso qual a probabilidade de o peso médio estar entre
# 95g e 105 g.?

# 10. O tempo até a falha de um conjunto de motores elétricos tem uma distribuição Exponencial
# com média de 28.500 horas. Qual a probabilidade de um destes ventiladores falhar nas
# primeiras 24.000 horas de funcionamento?

# 11. Considere que o tempo de resposta de um monitor de LCD tenha distribuição exponencial
# com média igual a 5 milissegundos, responda:
# a) Qual a probabilidade de o tempo de resposta ser de no máximo 10 milissegundos?
# b) Qual a probabilidade de o tempo de resposta estar entre 5 e 10 milissegundos?

# 12. As indústrias químicas têm alto custo de pesquisa para descobrir novas formas para agilizar
# certas reações químicas. Uma delas é o uso de catalisadores por enzimas (cinética
# enzimática) que normalmente atendem a distribuições exponenciais.
# Considerando que uma dessas reações com catalisação de enzimas demore em média
# 4.000 segundos, calcule:
# a) a probabilidade de uma reação durar mais de 2.000 segundos.
# b) a probabilidade de uma reação durar pelo menos 6.000 segundos, sabendo-se que ela já
# durou 4.000 segundos?

# 13. Uma fábrica de carros sabe que os motores de sua fabricação têm duração normal com média
# 150000 km e desvio-padrão de 5000 km. Qual a probabilidade de que um carro, escolhido ao
# acaso, dos fabricados por essa firma, tenha um motor que dure:
# a) Menos de 170000 km?
# b) Entre 140000 km e 165000 km?
# c) Se a fábrica substitui o motor que apresenta duração inferior à garantia, qual deve ser esta
# garantia para que a porcentagem de motores substituídos seja inferior a 0,2%?

# 14. Suponha que para uma população de adultos o peso seja uma variável aleatória normalmente
# distribuída, com média 75 kg e desvio padrão 8 kg. Além disso, suponha que, para adultos
# praticantes de Sumô, a distribuição dos pesos, é também Normal, com média 110 kg e desvio
# padrão 5 kg. Sete adultos comuns e três praticantes adultos de Sumô estão prestes a entrar
# num elevador com a seguinte inscrição: “Capacidade máxima 10 pessoas ou 850 kg”.
# Determine a probabilidade de que o peso dessas 10 pessoas ultrapasse a capacidade máxima
# do elevador.

# 15. A capacidade máxima de um elevador é 500kg. Se a distribuição dos pesos de cada usuário é
# normal com média 70 e variância 100:
# a) Qual é a probabilidade de sete passageiros ultrapassarem esse limite?
# b) E seis passageiros?

# 16. O lucro diário de uma corretora de valores, em milhares de reais é dado por L = 2 LA + 5 LI + 3
# LC, com LA, LI e LC representando respectivamente os lucros diários nos setores de Agricultura,
# Indústria e Comércio. As distribuições de probabilidades dessas variáveis aleatórias são
# respectivamente LA ~ N(3, 4), LI ~ N(6, 9) e LC ~ N(4,16). Supondo independência entre esses
# três setores, calcule:
# a. A distribuição normal do lucro dos três setores?
# b. A probabilidade de um lucro diário acima de 50 mil?

# 17. Após realizar uma extensa pesquisa, você nota-se que o tempo necessário para que uma
# bactéria do tipo Bacillus Velox se reproduza segue a distribuição exponencial com média de 10
# minutos. Calcular:
# a. A probabilidade que essa bactéria se reproduza em menos de 7 minutos ?
# b. A probabilidade que essa bactéria se reproduza entre de 5 minutos e 8 minutos ?
# c. O valor esperado e variância para o tempo de reprodução dessa bactéria ?

# 18. Suponha que as medidas da corrente elétrica em pedaço de fio sigam a distribuição Normal,
# com uma média de 10 miliamperes e uma variância de 4 miliamperes.
# a. (a) Qual a probabilidade de a medida exceder 13 miliamperes?
# b. (b) Qual a probabilidade de a medida da corrente estar entre 9 e 11 miliamperes?
# c. (c) Determine o valor para o qual a probabilidade de uma medida da corrente estar
# abaixo desse valor seja 0,98.

# 19. Um elevador te seu funcionamento bloqueado se sua carga for superior a 450 Kg. Adultos tem
# pesos que obedecem a uma distribuição normal, com peso 70 Kg e desvio padrão 15 Kg.
# Calcular a probabilidade de ocorrer bloqueio e uma tentativa de transportar 6 adultos.

# 20. O custo de um produto X é calculado incluindo os custos fixos, mão de obra e matéria-prima.
# Os custos fixos têm média de R$ 1.000,00, com desvio padrão de R$ 80,00, o custo da mão de
# obra tem média R$ 5.000,00 e desvio padrão de R$ 100,00. A matéria prima é o dobro do custo
# da mão de obra. Admita que os custos são independentes e que obedecem a distribuição
# normal. Determinar:
# a. A média e o desvio padrão do produto X.
# b. A probabilidade do produto X custar mais de R$ 16.500,00.
# c. A probabilidade de que o custo do produto X esteja entre R$ 15.800,00 e R$
# 16.900,00.
