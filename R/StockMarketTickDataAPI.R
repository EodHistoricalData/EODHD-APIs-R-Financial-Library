source("R/BaseAPI.R")


#' Get stock market tick data
#'
#' This function retrieves stock market tick data from the API.
#'
#' @param api_token The API token for authentication.
#' @param symbol consists of two parts: SYMBOL_NAME.EXCHANGE_ID. This API works only for US exchanges for the moment,
#' then you can use 'AAPL' or 'AAPL.US' to get the data as well for other US tickers.
#' @param limit use ‘a’ for ascending dates (from old to new), ‘d’ for descending dates (from new to old).
#' @param from_timestamp use these parameters to filter data by datetime.
#' Parameters should be passed in UNIX time with UTC timezone,
#' for example, these values are correct: “from=1627896900&to=1630575300” and
#' correspond to ' 2021-08-02 09:35:00 ' and ' 2021-09-02 09:35:00 '.
#' @param to_timestamp use these parameters to filter data by datetime.
#'
#' @return A list containing the stock market tick data.
#'
#' @examples
#' api_token <- "demo"
#' from_timestamp <- "1694354400"
#' to_timestamp <- "1694455200"
#' symbol <- "AAPL"
#' limit <- 2
#' result <- get_stock_market_tick_data(api_token, symbol, from_timestamp, to_timestamp, limit)
#'
#' @export
get_stock_market_tick_data <- function(api_token, symbol, from_timestamp,
                                       to_timestamp, limit = 1) {

  endpoint <- 'ticks'

  if (is.null(symbol) || symbol == "") {
    stop("symbol cannot be empty")
  }
  if (is.null(from_timestamp) || from_timestamp == "") {
    stop("from_timestamp cannot be empty")
  }
  if (is.null(to_timestamp) || to_timestamp == "") {
    stop("to_timestamp cannot be empty")
  }

  query_string <- list()

  query_string$s <- as.character(symbol)
  query_string$from <- as.numeric(from_timestamp)
  query_string$to <- as.numeric(to_timestamp)

  query_string$limit <-  as.numeric(limit)

  return(rest_get_method(api_key = api_token, endpoint = endpoint, querystring = query_string))
}
