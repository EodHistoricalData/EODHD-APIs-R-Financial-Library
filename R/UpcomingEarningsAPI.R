source("R/BaseAPI.R")


#' Get upcoming earnings data
#'
#' This function retrieves upcoming earnings data from the API.
#'
#' @param api_token The API token for authentication.
#' @param from_date Format: YYYY-MM-DD. The start date for earnings data, if not provided, today will be used.
#' @param to_date Format: YYYY-MM-DD. The end date for earnings data, if not provided, today + 7 days will be used.
#' @param symbols You can request specific symbols to get historical and upcoming data.
#'
#' @return A list containing the upcoming earnings data.
#'
#' @examples
#' api_token <- "demo"
#' from_date <- "2017-09-10"
#' to_date <- "2017-09-12"
#' symbols <- "MS"
#' result <- get_upcoming_earnings_data(api_token, from_date, to_date, symbols)
#'
#' @export
get_upcoming_earnings_data <- function(api_token, from_date = NULL, to_date = NULL, symbols = NULL) {

  endpoint <- 'calendar/earnings'

  query_string <- list()

  if (!is.null(from_date)) {
    query_string$from <- as.character(from_date)
  }
  if (!is.null(to_date)) {
    query_string$to <-  as.character(to_date)
  }
  if (!is.null(symbols)) {
    query_string$symbols <- as.character(symbols)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, querystring = query_string))
}
