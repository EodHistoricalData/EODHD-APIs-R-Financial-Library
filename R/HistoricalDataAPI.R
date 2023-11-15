source("R/BaseAPI.R")


#' Get historical data
#'
#' This function retrieves historical data from the API.
#'
#' @param api_token The API token for authentication.
#' @param symbol consists of two parts: SYMBOL_NAME.EXCHANGE_ID, then you can use, for example, AAPL.MX for Mexican Stock Exchange. or AAPL.US for NASDAQ
#' @param period use 'd' for daily, 'w' for weekly, 'm' for monthly prices. By default, daily prices will be shown.
#' @param order use ‘a’ for ascending dates (from old to new), ‘d’ for descending dates (from new to old).
#' @param from_date Format: YYYY-MM-DD. The start date for earnings data, if not provided, today will be used.
#' @param to_date Format: YYYY-MM-DD. The end date for earnings data, if not provided, today + 7 days will be used.
#'
#' @return A list containing the historical data.
#'
#' @examples
#' api_token <- "demo"
#' from_date <- "2017-09-10"
#' to_date <- "2017-09-12"
#' symbol <- "AAPL.MX"
#' period <- "d"
#' order <- "a"
#' result <- get_eod_historical_stock_market_data(api_token, symbol, from_date, to_date, period, order)
#'
#' @export
get_eod_historical_stock_market_data <- function(api_token, symbol, from_date = NULL,
                                to_date = NULL, period = 'd', order = 'a') {

  endpoint <- 'eod'

  if (is.null(symbol) || symbol == "") {
    stop("symbol cannot be empty")
  }

  uri <- symbol

  query_string <- list()

  if (!is.null(from_date)) {
    query_string$from <- as.character(from_date)
  }
  if (!is.null(to_date)) {
    query_string$to <-  as.character(to_date)
  }
  if (!is.null(period)) {
    query_string$period <-  as.character(period)
  }
  if (!is.null(order)) {
    query_string$order <-  as.character(order)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, uri=uri, querystring = query_string))
}
