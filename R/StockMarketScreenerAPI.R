source("../R/BaseAPI.R")


#' Stock market screener
#'
#' This function retrieves stock market screener from the API.
#'
#' @param api_token The API token for authentication.
#' @param sort Sorts all fields with type ‘Number’ in ascending/descending order.
#' @param filters Filters out tickers by different fields.
#' @param limit The number of results should be returned with the query.
#' @param signals Filter out tickers by signals, the calculated fields.
#' @param offset The offset of the data.
#'
#' @return A list containing the stock market screener.
#'
#' @examples
#' api_token <- "demo"
#' sort <- "market_capitalization.desc"
#' filters <- "[["market_capitalization",">",1000],["name","match","apple"],["code","=","AAPL"],["exchange","=","us"],["sector","=","Technology"]]"
#' limit <- "1"
#' signals <- "bookvalue_neg"
#' offset <- "50"
#' result <- stock_market_screener(api_token, sort, filters, limit, signals, offset)
#'
#' @export
stock_market_screener <- function(api_token, sort = NULL, filters = NULL, limit = NULL, signals = NULL, offset = NULL) {
  
  endpoint <- 'screener'
  
  query_string <- list()
  
  if (!is.null(sort)) {
    query_string$sort <- as.character(sort)
  }
  if (!is.null(filters)) {
    query_string$filters <- as.character(filters)
  }
  if (!is.null(limit)) {
    query_string$limit <- as.character(limit)
  }
  if (!is.null(signals)) {
    query_string$signals <- as.character(signals)
  }
  if (!is.null(offset)) {
    query_string$offset <- as.character(offset)
  }
  
  return(rest_get_method(api_key = api_token, endpoint = endpoint, querystring = query_string))
}