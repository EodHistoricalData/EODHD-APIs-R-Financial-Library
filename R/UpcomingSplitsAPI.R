source("R/BaseAPI.R")


#' Get upcoming splits data
#'
#' This function retrieves upcoming splits data from the API.
#'
#' @param api_token The API token for authentication.
#' @param from_date Format: YYYY-MM-DD. The start date for splits data, if not provided, today will be used.
#' @param to_date Format: YYYY-MM-DD. The end date for splits data, if not provided, today + 7 days will be used.
#'
#' @return A list containing the upcoming splits data.
#'
#' @examples
#' api_token <- "demo"
#' from_date <- "2017-09-10"
#' to_date <- "2017-09-12"
#' result <- get_upcoming_splits_data(api_token, from_date, to_date)
#'
#' @export
get_upcoming_splits_data <- function(api_token, from_date = NULL, to_date = NULL) {

  endpoint <- 'calendar/splits'
  query_string <- list()

  if (!is.null(from_date)) {
    query_string$from <- as.character(from_date)
  }
  if (!is.null(to_date)) {
    query_string$to <- as.character(to_date)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, querystring = query_string))
}
