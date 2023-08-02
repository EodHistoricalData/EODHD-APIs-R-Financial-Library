source("BaseAPI.R")


get_bonds_fundamentals_data <- function(api_token, isin) {
  endpoint <- "bond-fundamentals"
  uri <- isin
  
  querystring <- list()
  
  
  if (is.null(isin) || isin == "") {
    stop("isin cannot be empty")
  }
  
  return(rest_get_method(api_key=api_token, endpoint=endpoint, uri=uri))
}