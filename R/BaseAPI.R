library(httr)
library(jsonlite)

rest_get_method <- function(api_key, endpoint = "", uri = "", querystring = list()) {
  api_url <- "https://eodhd.com/api"
  
    url = paste0(api_url, "/", endpoint, "/", uri)
    querystring$fmt = "json"
    querystring$api_token = api_key
    
    resp <- GET(url = url, query = querystring)
  
  
  if (status_code(resp) != 200) {
    stop("Cannot get data")
  }
  
  return(content(resp, as = "parsed"))
}

