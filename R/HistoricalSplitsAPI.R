source("R/BaseAPI.R")


#' Get historical splits data
#'
#' This function retrieves historical splits data from the API.
#'
#' @param api_token The API token for authentication.
#' @param ticker consists of two parts: [SYMBOL_NAME].[EXCHANGE_ID].
#' @param date_from date from with format Y-m-d
#' @param date_to date from with format Y-m-d
#'
#' @return A list containing historical splits data.
#'
#' @examples
#' api_token <- "demo"
#' ticker <- "AAPL.US"
#' date_from <- "2017-09-10"
#' date_to <- "2017-09-12"
#' result <- get_historical_splits_data(api_token, ticker, date_from, date_to)
#'
#' @export
get_historical_splits_data <- function(api_token, ticker, date_from = NULL, date_to = NULL) {

  endpoint <- 'splits/'

  if (is.null(ticker) || ticker == "") {
    stop("Ticker is empty. You need to add ticker to args")
  }

  query_string <- list()

  if (!is.null(date_to)) {
    query_string$to <- as.character(date_to)
  }
  if (!is.null(date_from)) {
    query_string$from <- as.character(date_from)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, uri = ticker, querystring = query_string))
}
