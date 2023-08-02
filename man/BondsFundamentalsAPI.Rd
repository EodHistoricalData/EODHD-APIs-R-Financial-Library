#' Get bonds fundamentals data
#'
#' This function retrieves bond fundamentals data from the API.
#'
#' @param api_token The API token for authentication.
#' @param isin The ISIN (International Securities Identification Number) of the bond.
#'
#' @return A list containing the bond fundamentals data.
#'
#' @examples
#' api_token <- "demo"
#' isin <- "DE000CB83CF0"
#' result <- get_bonds_fundamentals_data(api_token, isin)
#'
#' @export
get_bonds_fundamentals_data <- function(api_token, isin) {
  endpoint <- "bond-fundamentals"
  uri <- isin
  
  querystring <- list()
  
  if (is.null(isin) || isin == "") {
    stop("isin cannot be empty")
  }
  
  return(rest_get_method(api_key=api_token, endpoint=endpoint, uri=uri))
}