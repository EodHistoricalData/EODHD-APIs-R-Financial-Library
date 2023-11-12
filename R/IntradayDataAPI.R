source("R/BaseAPI.R")


#' Get historical intraday data
#'
#' This function retrieves historical intraday data from the API.
#' IMPORTANT: data for all exchanges is provided in the UTC timezone, with Unix timestamps.
#'
#' @param api_token The API token for authentication.
#' @param symbol consists of two parts: SYMBOL_NAME.EXCHANGE_ID, then you can use, for example, AAPL.MX for Mexican Stock Exchange. or AAPL.US for NASDAQ
#' @param interval the possible intervals: ‘5m’ for 5-minutes, ‘1h’ for 1 hour, and ‘1m’ for 1-minute intervals.
#' @param from_unix_time Parameters should be passed in UNIX time with UTC timezone, for example,
#' these values are correct: “from=1627896900&to=1630575300” and correspond to
#' ‘ 2021-08-02 09:35:00 ‘ and ‘ 2021-09-02 09:35:00 ‘.
#' @param to_unix_time Parameters should be passed in UNIX time with UTC timezone.
#'
#' @return A list containing the historical data.
#'
#' @examples
#' api_token <- "demo"
#' from_unix_time <- "1627896900"
#' to_unix_time <- "1630575300"
#' symbol <- "AAPL.MX"
#' interval <- "5m"
#' result <- get_intraday_historical_data(api_token, symbol, from_unix_time, to_unix_time, interval)
#'
#' @export
get_intraday_historical_data <- function(api_token, symbol, from_unix_time = NULL,
                                         to_unix_time = NULL, interval = '5m') {

  endpoint <- 'intraday'

  if (is.null(symbol) || symbol == "") {
    stop("symbol cannot be empty")
  }

  uri <- symbol

  query_string <- list()

  if (!is.null(from_unix_time)) {
    query_string$from_unix_time <- as.character(from_unix_time)
  }
  if (!is.null(to_unix_time)) {
    query_string$to_unix_time <-  as.character(to_unix_time)
  }
  if (!is.null(interval)) {
    query_string$interval <-  as.character(interval)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, uri=uri, querystring = query_string))
}
