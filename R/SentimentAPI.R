source("R/BaseAPI.R")


#' Get sentiment data.
#'
#' This function retrieves sentiment data from the API.
#'
#' @param api_token The API token for authentication.
#' @param s Parameter to your URL and you will be able to get data for multiple tickers at one request, all tickers should be separated with a comma.
#' @param from_date Format: YYYY-MM-DD.
#' @param to_date Format: YYYY-MM-DD.
#'
#' @return A list containing the sentiment data.
#'
#' @examples
#' api_token <- "demo"
#' from_date <- "2017-09-10"
#' to_date <- "2017-09-12"
#' s <- "AAPL.MX"
#' result <- get_sentiment_data(api_token, s, from_date, to_date)
#'
#' @export
get_sentiment_data <- function(api_token, s, from_date = NULL,
                                to_date = NULL) {

  endpoint <- 'sentiments'

  if (is.null(s) || s == "") {
    stop("s cannot be empty")
  }

  query_string <- list()

  query_string$s <-  as.character(s)
  if (!is.null(from_date)) {
    query_string$from <- as.character(from_date)
  }
  if (!is.null(to_date)) {
    query_string$to <-  as.character(to_date)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, querystring = query_string))
}
