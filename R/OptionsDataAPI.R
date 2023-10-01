source("R/BaseAPI.R")


#' Get options data
#'
#' This function retrieves options data from the API.
#'
#' @param api_token The API token for authentication.
#' @param ticker Required - Could be any supported symbol. No default value.
#' @param date_to date from with format Y-m-d
#' @param date_from date from with format Y-m-d
#' @param trade_date_to date from with format Y-m-d
#' @param trade_date_from date from with format Y-m-d
#' @param contract_name Name of a particular contract.
#'
#' @return A list containing options data.
#'
#' @examples
#' api_token <- "demo"
#' ticker <- "AAPL.US"
#' date_to <- "2017-09-10"
#' date_from <- "2017-09-12"
#' trade_date_to <- "2010-05-15"
#' trade_date_from <- "2010-05-16"
#' contract_name <- "AAPL230818C00055000"
#' result <- get_options_data(api_token, date_to, date_from, trade_date_to, trade_date_from, contract_name)
#'
#' @export
get_options_data <- function(api_token, ticker, date_to = NULL, date_from = NULL,
                              trade_date_to = NULL, trade_date_from = NULL, contract_name = NULL) {

  endpoint <- 'options'
  if (is.null(ticker) || ticker == "") {
    stop("Ticker is empty. You need to add ticker to args")
  }

  uri <- ticker

  query_string <- list()

  if (!is.null(date_to)) {
    query_string$date_to <- as.character(date_to)
  }
  if (!is.null(date_from)) {
    query_string$date_from <- as.character(date_from)
  }
  if (!is.null(trade_date_from)) {
    query_string$trade_date_from <- as.character(trade_date_from)
  }
  if (!is.null(trade_date_to)) {
    query_string$trade_date_to <- as.character(trade_date_to)
  }
  if (!is.null(contract_name)) {
    query_string$contract_name <- as.character(contract_name)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, querystring = query_string, uri = uri))
}
