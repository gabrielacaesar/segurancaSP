#' Obtém dados sobre ocorrências de Violência Contra as Mulheres, no Estado de São Paulo.
#'
#' @return Retorna uma tibble.
#' @export
#' @name dados_violencia_mulher
#' @examples
#'
#'
`%>%` <- magrittr::`%>%`

dados_violencia_mulher <- function(formato = "tidy") {
  html <-
    "http://www.ssp.sp.gov.br/Estatistica/ViolenciaMulher.aspx" %>%
    xml2::read_html()

  id_mes_ano <- html %>%
    rvest::html_nodes(xpath = "//*[@class='table-responsive']/preceding-sibling::div") %>%
    rvest::html_nodes("span") %>%
    rvest::html_text() %>%
    tibble::as_tibble() %>%
    dplyr::mutate(
      value = stringr::str_remove_all(value, "Ocorrências Registradas no mês: "),
      table_id = as.character(dplyr::row_number())
    ) %>%
    tidyr::separate(value, c("mes", "ano"), sep = " de ")

  tabela_incompleta <- html %>%
    rvest::html_table() %>%
    purrr::map(~ tibble::as_tibble(.x, .name_repair = "unique")) %>%
    purrr::map(~ dplyr::rename(.x,  "crime" = `...1`)) %>%
    dplyr::bind_rows(.id = "table_id")

  tabela_original <- tabela_incompleta %>%
    dplyr::left_join(id_mes_ano) %>%
    dplyr::select(-table_id)


  tabela_tidy <-  tabela_original %>%
    tidyr::pivot_longer(cols = c(Capital, Demacro, Interior, Total),
                        names_to = "local") %>%
    dplyr::rename("ocorrencias" = value) %>%
    dplyr::filter(local != "Total")

  if(formato == "tidy"){
    return(tabela_tidy)
  } else {
    return(tabela_original)
  }


}



violencia_contra_mulheres_sp <- dados_violencia_mulher()

usethis::use_data(violencia_contra_mulheres_sp, overwrite = TRUE )
