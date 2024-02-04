source("R/BaseAPI.R")


#' Get stock market tick data
#'
#' This function retrieves stock market tick data from the API.
#'
#' @param api_token The API token for authentication.
#' @param ticker is the ticker code and it consists of two parts: SYMBOL_NAME.EXCHANGE_ID
#' @param from_date Format: YYYY-MM-DD.
#' @param to_date Format: YYYY-MM-DD.
#'
#' @return A list containing the stock market tick data.
#'
#' @examples
#' api_token <- "demo"
#' from_date <- "2017-09-10"
#' to_date <- "2017-09-12"
#' ticker <- "AAPL"
#' result <- get_historical_market_capitalization_data(api_token, ticker, from_date, to_date)
#'
#' @export
get_historical_market_capitalization_data <- function(api_token, ticker,
                                                      from_date = NULL,
                                                      to_date = NULL) {

  endpoint <- 'historical-market-cap'

  if (is.null(ticker) || ticker == "") {
    stop("symbol cannot be empty")
  }

  uri <- ticker
  query_string <- list()


  if (!is.null(from_date)) {
    query_string$from <-  as.character(from_date)
  }
  if (!is.null(to_date)) {
    query_string$to <-  as.character(to_date)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, uri=uri, querystring = query_string))
}
