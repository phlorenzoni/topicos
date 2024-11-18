# Modulo statistical tools em Fortran 
### Este módulo possui funções para o cálculo de média, desvio padrão e variância    
Para utilizar as funções, o usuário deve passar a quantidade de dados (Ndados) e o vetor no qual serão calculadas as estatísticas.    
Exemplo:    
Ndados=5    
vetor=[2,4,2,4,2]    
a função será chamada da seguinte maneira: media(Ndados,vetor), retornando o valor da média.    
O mesmo vale para a variância.    
No caso do desvio padrão, basta passar o valor da variância como argumento da função.    
Para utilizar a função media móvel, o usuário deverá especificar a largura da janela (número de dados consecutivos a ser utilizado para média).    
