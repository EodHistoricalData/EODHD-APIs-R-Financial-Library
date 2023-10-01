source("R/BaseAPI.R")


#' Get economic events data
#'
#' This function retrieves economic events data from the API.
#'
#' @param api_token The API token for authentication.
#' @param date_from date from with format Y-m-d
#' @param date_to date from with format Y-m-d
#' @param country The country code is in ISO 3166 format, has 2 symbols
#' @param comparison Possible values: mom, qoq, yoy
#' @param offset Possible values from 0 to 1000
#' @param limit Possible values from 0 to 1000
#'
#' @return A list containing economic data events.
#'
#' @examples
#' api_token <- "demo"
#' date_from <- "2017-09-10"
#' date_to <- "2017-09-12"
#' country <- "US"
#' comparison <- "qoq"
#' offset <- "0"
#' limit <- "50"
#' result <- gget_economic_events_data(api_token, date_from, date_to, country, comparison, offset, limit)
#'
#' @export
get_economic_events_data <- function(api_token, date_from = NULL, date_to = NULL,
                                     country = NULL, comparison = NULL, offset = NULL, limit = NULL) {

  endpoint <- 'economic-events'

  query_string <- list()

  if (!is.null(date_to)) {
    query_string$date_to <- as.character(date_to)
  }
  if (!is.null(date_from)) {
    query_string$date_from <- as.character(date_from)
  }
  if (!is.null(country)) {
    query_string$country <- as.character(country)
  }
  if (!is.null(comparison)) {
    query_string$comparison <- as.character(comparison)
  }
  if (!is.null(offset)) {
    query_string$offset <- as.character(offset)
  }
  if (!is.null(limit)) {
    query_string$limit <- as.character(limit)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, querystring = query_string))
}
