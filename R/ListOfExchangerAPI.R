source("R/BaseAPI.R")


#' Get list of exchanges
#'
#' This function retrieves list of exchanges from the API.
#'
#' @param api_token The API token for authentication.
#'
#' @return A list containing the list of exchanges.
#'
#' @examples
#' api_token <- "demo"
#' result <- get_list_of_exchanges(api_token)
#'
#' @export
get_list_of_exchanges <- function(api_token) {

  endpoint <- 'exchanges-list'

  return(rest_get_method(api_key = api_token, endpoint = endpoint))
}
