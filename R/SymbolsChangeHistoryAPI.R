source("R/BaseAPI.R")

#' Get symbol change history
#'
#' This function retrieves symbol change history from the API.
#'
#' @param api_token The API token for authentication.
#' @param from_date The start date for symbol change history (optional).
#' @param to_date The end date for symbol change history (optional).
#'
#' @return A list containing symbol change history data.
#'
#' @examples
#' api_token <- "demo"
#' from_date <- "2023-01-01"
#' to_date <- "2023-12-31"
#' result <- symbol_change_history(api_token, from_date, to_date)
#'
#' @export
symbol_change_history <- function(api_token, from_date = NULL, to_date = NULL) {

  endpoint <- 'symbol-change-history'

  query_string <- list()

  if (!is.null(from_date)) {
    query_string$from_date <- as.character(from_date)
  }
  if (!is.null(to_date)) {
    query_string$to_date <- as.character(to_date)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, querystring = query_string))
}
