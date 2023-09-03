source("../R/BaseAPI.R")


#' Get earning trends data
#'
#' This function retrieves earning trends data from the API.
#'
#' @param api_token The API token for authentication.
#' @param symbols You can request specific symbols to get historical and upcoming data
#'
#' @return A list containing earning trends.
#'
#' @examples
#' api_token <- "demo"
#' symbols <- "AAPL.US"
#' result <- get_earning_trends_data(api_token, symbols)
#'
#' @export
get_earning_trends_data <- function(api_token, symbols) {
  
  endpoint <- 'calendar/trends'
  query_string <- list()
  
  query_string$symbols <- as.character(symbols)
  
  return(rest_get_method(api_key = api_token, endpoint = endpoint, querystring = query_string))
}