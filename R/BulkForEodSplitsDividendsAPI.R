source("R/BaseAPI.R")


#' Get bulk fundamentals data
#'
#' This function retrieves bulk fundamentals data from the API.
#'
#' @param api_token The API token for authentication.
#' @param country <- 'US'
#' @param type <- can be empty, splits or dividends
#' @param date By default, the data for last trading day will be downloaded, but if you need any specific date, add ‘date’ parameter to the URL
#' @param symbols To download last day data for several symbols, for example, for MSFT and AAPL, you can add the ‘symbols’ parameter
#' @param filter If you need more data, like company name, you can use ‘&filter=extended’
#'
#' @return A list containing bulk fundamentals data.
#'
#' @examples
#' api_token <- "demo"
#' country <- 'US'
#' type <- 'splits'
#' date <- "2010-09-21"
#' symbols <- "MSFT"
#' filter <- "extended"
#' result <- get_bulk_eod_splits_dividends_data(api_token, country, type, date, symbols, filter)
#'
#' @export
get_bulk_eod_splits_dividends_data = function(api_token, country = 'US', type = NULL, date = NULL,
                                      symbols = NULL, filter = NULL) {

  endpoint <- 'eod-bulk-last-day'
  uri <- country

  query_string <- list()

  if (!is.null(type)) {
    query_string$type <- as.character(type)
  }
  if (!is.null(date)) {
    query_string$date <- as.character(date)
  }
  if (!is.null(symbols)) {
    query_string$symbols <- as.character(symbols)
  }
  if (!is.null(filter)) {
    query_string$filter <- as.character(filter)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, uri = uri, querystring = query_string))
}


