source("R/BaseAPI.R")


#' Get macro indicators data
#'
#' This function retrieves macro indicators data from the API.
#'
#' @param api_token The API token for authentication.
#' @param country Defines the country for which the indicator will be shown. The country should be defined in the Alpha-3 ISO format.
#' @param indicator Defines which macroeconomics data indicator will be shown. All possible indicators will be avaliable on: https://eodhistoricaldata.com/financial-apis/macroeconomics-data-and-macro-indicators-api/
#'
#' @return A list containing the macro indicators data.
#'
#' @examples
#' api_token <- "demo"
#' country <- "USA"
#' indicator <- "gdp_current_usd"
#' result <- get_macro_indicators_data(api_token, country, indicator)
#'
#' @export
get_macro_indicators_data <- function(api_token, country, indicator = NULL) {

  endpoint <- 'macro-indicator'
  uri <- country

  query_string <- list()

  if (!is.null(indicator)) {
    query_string$indicator <- as.character(indicator)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, querystring = query_string, uri = uri))
}
