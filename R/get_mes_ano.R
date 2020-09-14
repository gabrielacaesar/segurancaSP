#' Mês e ano do dado da SSP-SP
#' Captura, limpa e separa em colunas mês e ano das tabelas
#'
#' @export
get_mes_ano <- function(){
  "http://www.ssp.sp.gov.br/Estatistica/ViolenciaMulher.aspx" %>%
    read_html() %>%
    html_nodes(xpath = "//*[@class='table-responsive']/preceding-sibling::div") %>%
    html_nodes("span") %>%
    html_text() %>%
    as.data.frame() %>%
    rename("mes" = ".") %>%
    mutate(mes = str_remove_all(mes, "Ocorrências Registradas no mês: "),
           table_id = row_number()) %>%
    mutate(mes = str_replace_all(mes, "Janeiro de ", "01/"),
           mes = str_replace_all(mes, "Fevereiro de ", "02/"),
           mes = str_replace_all(mes, "Março de ", "03/"),
           mes = str_replace_all(mes, "Abril de ", "04/"),
           mes = str_replace_all(mes, "Maio de ", "05/"),
           mes = str_replace_all(mes, "Junho de ", "06/"),
           mes = str_replace_all(mes, "Julho de ", "07/"),
           mes = str_replace_all(mes, "Agosto de ", "08/"),
           mes = str_replace_all(mes, "Setembro de ", "09/"),
           mes = str_replace_all(mes, "Outubro de ", "10/"),
           mes = str_replace_all(mes, "Novembro de ", "11/"),
           mes = str_replace_all(mes, "Dezembro de ", "12/")) %>%
    separate(mes, c("mes", "ano"), sep = "/")
}

get_mes_ano()
