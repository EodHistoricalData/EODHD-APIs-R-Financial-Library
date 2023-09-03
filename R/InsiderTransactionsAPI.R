source("../R/BaseAPI.R")


#' Get insider transactions data
#'
#' This function retrieves the insider transactions from the API.
#'
#' @param api_token The API token for authentication.
#' @param date_from date from with format Y-m-d
#' @param date_to date from with format Y-m-d
#' @param code to get the data only for Apple Inc (AAPL), use AAPL.US or AAPL ticker code.
#' @param limit the limit for entries per result, from 1 to 1000.
#'
#' @return A list containing the insider transactions data.
#'
#' @examples
#' api_token <- "demo"
#' date_from <- "2017-09-10"
#' date_to <- "2017-09-12"
#' code <- "AAPL.US"
#' limit <- "150"
#' result <- get_insider_transactions_data(api_token, date_from, date_to, code, limit)
#'
#' @export
get_insider_transactions_data <- function(api_token, date_from = NULL, date_to = NULL, code = NULL, limit = NULL) {
  
  endpoint <- 'insider-transactions'
  query_string <- list()
  
  if (!is.null(date_to)) {
    query_string$date_to <- as.character(date_to)
  }
  if (!is.null(date_from)) {
    query_string$date_from <- as.character(date_from)
  }
  if (!is.null(code)) {
    query_string$code <- as.character(code)
  }
  if (!is.null(limit)) {
    query_string$limit <- as.character(limit)
  }
  
  return(rest_get_method(api_key = api_token, endpoint = endpoint, querystring = query_string))
}