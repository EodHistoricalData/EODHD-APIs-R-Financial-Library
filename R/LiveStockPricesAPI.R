source("R/BaseAPI.R")


#' Get live stock prices
#'
#' This function retrieves live stock prices from the API.
#'
#' @param api_token The API token for authentication.
#' @param ticker consists of two parts: [SYMBOL_NAME].[EXCHANGE_ID]
#' @param s add “s=” parameter to your function and you will be able to get data for multiple tickers at one request, all tickers should be separated with a comma.
#'
#' @return A list containing a live stock prices.
#'
#' @examples
#' api_token <- "demo"
#' ticker <- "AAPL.US"
#' s <- "VTI,EUR.FOREX"
#' result <- get_live_stock_prices(api_token, ticker, s)
#'
#' @export
get_live_stock_prices <- function(api_token, ticker, s = NULL) {

  endpoint <- 'real-time/'
  query_string <- list()

  if (is.null(ticker) || ticker == "") {
    stop("Ticker is empty. You need to add ticker to args")
  }

  if (!is.null(s)) {
    query_string$s <- as.character(s)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, uri = ticker, querystring = query_string))
}
