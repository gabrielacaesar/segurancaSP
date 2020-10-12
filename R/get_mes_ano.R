#' Mês e ano do dado da SSP-SP
#' Captura, limpa e separa em colunas mês e ano das tabelas
#'
#' @export
get_mes_ano <- function(){
  "http://www.ssp.sp.gov.br/Estatistica/ViolenciaMulher.aspx" %>%
    xml2::read_html() %>%
    html_nodes(xpath = "//*[@class='table-responsive']/preceding-sibling::div") %>%
    rvest::html_nodes("span") %>%
    rvest::html_text() %>%
    as.data.frame() %>%
    dplyr::rename("mes" = ".") %>%
    dplyr::mutate(mes = stringr::str_remove_all(mes, "Ocorrências Registradas no mês: "),
           table_id = dplyr::row_number()) %>%
    dplyr::mutate(mes = str_replace_all(mes, "Janeiro de ", "01/"),
           mes = stringr::str_replace_all(mes, "Fevereiro de ", "02/"),
           mes = stringr::str_replace_all(mes, "Março de ", "03/"),
           mes = stringr::str_replace_all(mes, "Abril de ", "04/"),
           mes = stringr::str_replace_all(mes, "Maio de ", "05/"),
           mes = stringr::str_replace_all(mes, "Junho de ", "06/"),
           mes = stringr::str_replace_all(mes, "Julho de ", "07/"),
           mes = stringr::str_replace_all(mes, "Agosto de ", "08/"),
           mes = stringr::str_replace_all(mes, "Setembro de ", "09/"),
           mes = stringr::str_replace_all(mes, "Outubro de ", "10/"),
           mes = stringr::str_replace_all(mes, "Novembro de ", "11/"),
           mes = stringr::str_replace_all(mes, "Dezembro de ", "12/")) %>%
    tidyr::separate(mes, c("mes", "ano"), sep = "/")
}

