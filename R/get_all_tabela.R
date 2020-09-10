#' Extração de todas as tabelas da SSP-SP
#' Recebe uma URL
#'
#' @export
get_all_tabela <- function(){
  map_dfr(1:count_tabela(), get_tabela())
}

get_all_tabela()
