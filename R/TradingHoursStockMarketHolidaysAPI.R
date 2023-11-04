source("R/BaseAPI.R")


#' Get details trading hours, stock market holidays and symbol change history
#'
#' This function retrieves details trading hours, stock market holidays and symbol change history from the API.
#'
#' @param api_token The API token for authentication.
#' @param code Use the exchange code from the API endpoint
#' @param from_date  the format is ‘YYYY-MM-DD’
#' @param to_date  the format is ‘YYYY-MM-DD’
#'
#' @return A list containing the details trading hours, stock market holidays and symbol change history.
#'
#' @examples
#' api_token <- "demo"
#' code <- "US"
#' from_date <- "2017-09-10"
#' to_date <- "2017-09-12"
#'
#' result <- get_details_trading_hours_stock_market_holidays(api_token, code, from_date, to_date)
#'
#' @export
get_details_trading_hours_stock_market_holidays <- function(api_token, code, from_date = NULL, to_date = NULL) {

  endpoint <- 'exchange-details'
  uri <- code

  query_string <- list()

  if (!is.null(from_date)) {
    query_string$from_date <- as.character(from_date)
  }
  if (!is.null(to_date)) {
    query_string$to_date <- as.character(to_date)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, uri = uri, querystring = query_string))
}

