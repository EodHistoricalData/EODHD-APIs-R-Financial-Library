source("../R/BaseAPI.R")


#' Get fundamentals data data
#'
#' This function retrieves fundamentals data from the API.
#'
#' @param api_token The API token for authentication.
#' @param ticker consists of two parts: [SYMBOL_NAME].[EXCHANGE_ID]
#'
#' @return A list containing the fundamental data.
#'
#' @examples
#' api_token <- "demo"
#' ticker <- "AAPL.US"
#' result <- get_fundamentals_data(api_token, ticker)
#'
#' @export
get_fundamentals_data <- function(api_token, ticker) {
  
  endpoint <- 'fundamentals/'
  
  if (is.null(ticker) || ticker == "") {
    stop("Ticker is empty. You need to add ticker to args")
  }
  
  return(rest_get_method(api_key = api_token, endpoint = endpoint, uri = ticker))
}