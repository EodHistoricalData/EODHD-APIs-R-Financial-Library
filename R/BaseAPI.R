library(httr)

#' Generic REST GET method
#'
#' This function performs a generic REST GET request to the specified API endpoint.
#' It takes an API key, endpoint, URI, and querystring as input and returns the
#' response data in JSON format.
#'
#' @param api_key A character string representing the API key for authentication.
#' @param endpoint A character string representing the API endpoint to request.
#' @param uri A character string representing the URI for the request.
#' @param querystring A list of key-value pairs representing the query parameters for the request.
#'
#' @return The response data in JSON format.
#'
#' @examples
#' api_key <- "demo"
#' endpoint <- "bond-fundamentals"
#' uri <- "DE000CB83CF0"
#' querystring <- list()
#' result <- rest_get_method(api_key, endpoint, uri, querystring)
#' print(result)
#'
#' @importFrom httr GET status_code content
#'
#' @export
rest_get_method <- function(api_key, endpoint = "", uri = "", querystring = list()) {

  api_url <- "https://eodhd.com/api"

  url <- paste0(api_url, "/", endpoint, "/", uri)
  querystring$fmt <- "json"
  querystring$api_token <- api_key

  resp <- GET(url = url, query = querystring)

  if (status_code(resp) == 403) {
    errors <- list(error = 403, message = 'Access forbidden')
    return(errors)
  } else if (status_code(resp) == 400) {
    errors <- list(error = 400, message = 'Bad request')
    return(errors)
  } else if (status_code(resp) == 500) {
    errors <- list(error = 500, message = 'Internal Server Error')
    return(errors)
  } else if (status_code(resp) == 503) {
    errors <- list(error = 503, message = 'Service Unavailable')
    return(errors)
  }

  return(content(resp, as = "parsed"))
}
