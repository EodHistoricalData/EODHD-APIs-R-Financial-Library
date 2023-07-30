# Загрузка базового класса BaseAPI из файла BaseAPI.R
source("BaseAPI.R")


get_bonds_fundamentals_data <- function(api_token, isin) {
  endpoint <- "bond-fundamentals"
  uri <- isin
  
  querystring <- list()
  
  
  if (is.null(isin) || isin == "") {
    stop("isin cannot be empty")
  }
  
  # Вызываем метод _rest_get_method из базового класса BaseAPI
  return(rest_get_method(api_key=api_token, endpoint=endpoint, uri=uri))
}