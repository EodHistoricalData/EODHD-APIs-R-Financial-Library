source("../R/BaseAPI.R")


#' Get technical indicator data
#'
#' This function retrieves technical indicator data from the API.
#'
#' @param api_token The API token for authentication.
#' @param ticker consists of two parts: [SYMBOL_NAME].[EXCHANGE_ID]
#' @param func the function that will be applied to data series to get technical indicator data. 
#' @param period the number of data points used to calculate each moving average value.
#' @param date_from date from with format Y-m-d.
#' @param date_to date from with format Y-m-d.
#' @param order use ‘a’ for ascending dates (from old to new) and ‘d’ for descending dates (from new to old). 
#'                By default, dates are shown in ascending order.
#' @param splitadjusted_only By default, we calculate data for some functions by closes adjusted with splits and dividends. 
#'                If you need to calculate the data by closes adjusted only with splits, set this parameter to ‘1’. 
#'                Works with the following functions: sma, ema, wma, volatility, rsi, slope, and macd.
#'
#' @return A list containing the technical indicator data.
#'
#' @examples
#' api_token <- "demo"
#' ticker <- "AAPL.US"
#' func <- "sma"
#' period <- "100"
#' date_from <- "2017-09-10"
#' date_to <- "2017-09-12"
#' order <- "d"
#' splitadjusted_only <- "1"
#' result <- get_technical_indicator_data(api_token, ticker, function, period, date_from, date_to, order, splitadjusted_only)
#'
#' @export
possible_functions <- c('avgvol', 'avgvolccy', 'sma', 'ema', 'wma', 'volatility', 'stochastic',
                        'rsi', 'stddev', 'stochrsi', 'slope', 'dmi', 'adx', 'macd', 'atr',
                        'cci', 'sar', 'bbands', 'format_amibroker', 'splitadjusted')

get_technical_indicator_data <- function(api_token, ticker, func, period = 50,
                                         date_from = NULL, date_to = NULL, order = 'a', 
                                         splitadjusted_only = '0') {
  
  endpoint <- 'technical/'
  query_string <- list()
  
  if (is.null(ticker) || trimws(ticker) == "") {
    stop("Ticker is empty. You need to add ticker to args")
  }
  
  if (is.null(func) || trimws(func) == "") {
    stop("Function is empty. You need to add function to args")
  }
  
  if (!(func %in% possible_functions)) {
    stop("Incorrect value for function parameter")
  }

  query_string$order <- as.character(order)
  query_string$splitadjusted_only <- as.character(splitadjusted_only)
  query_string$period <- as.character(period)
  query_string$"function" <- as.character(func)
  
  if (!is.null(date_to)) {
    query_string$date_to <- as.character(date_to)
  }
  if (!is.null(date_from)) {
    query_string$date_from <- as.character(date_from)
  }
  
  return(rest_get_method(api_key = api_token, endpoint = endpoint, uri = ticker, querystring = query_string))
}