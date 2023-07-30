library(httr)
library(jsonlite)

rest_get_method <- function(api_key, endpoint = "", uri = "", querystring = list()) {
  api_url <- "https://eodhistoricaldata.com/api"
  
    url = paste0(api_url, "/", endpoint, "/", uri)
    querystring$fmt = "json"
    querystring$api_token = api_key
    
    resp <- GET(url = url, query = querystring)
  
  
  if (status_code(resp) != 200) {
    stop("Cannot get data")
  }
  
  return(content(resp, as = "parsed"))
}

rest_get_method(api_key = "64bce94f81ae02.82666688", 
                endpoint = "bond-fundamentals",
                uri ="DE000CB83CF0")
