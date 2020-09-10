# segurancaSP

### Visão geral
`segurancaSP` é um pacote criado para acessar dados de segurança pública do estado de São Paulo. A ideia é facilitar a captura, limpeza e organizacao das estatísticas de criminalidade disponíveis no site da secretaria estadual. Atualmente, ele pega dados relacionados à violência contra as mulheres.

Os dados não estão reunidos de forma consolidada em uma seção de dados abertos no site da SSP-SP. Este pacote tem como objetivo resolver esse problema com ajuda da programação em R. Este pacote é o projeto final para o curso online de ciência de dados 2 da Curso-R (turma de agosto/setembro de 2020). 

Clique [aqui](https://www.gabrielacaesar.com/2020/09/08/captura-de-dados-ssp-sp/) para ler sobre a construção do código.

Atenção: este pacote está em constante atualização.

Para instalar este pacote, você deve rodar na versão DEV:
```{r}
# install.packages("devtools")
devtools::install_github("gabrielacaesar/segurancaSP")
```
