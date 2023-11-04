source("R/BaseAPI.R")


#' Financial news
#'
#' This function retrieves financial news data from the API.
#'
#' @param api_token The API token for authentication.
#' @param s (required if t empty) - The ticker code to get news for.
#' @param t (required if s empty) - The tag to get news on a given topic.
#' @param from_date date from with format Y-m-d
#' @param to_date date from with format Y-m-d
#' @param limit The number of results should be returned with the query
#' @param offset The offset of the data.
#'
#' @return A list containing the financial news.
#'
#' @examples
#' api_token <- "demo"
#' s <- "balance sheet"
#' t <- NULL
#' from_date <- "2017-09-10"
#' to_date <- "2017-09-12"
#' limit <- "50"
#' offset <- "100"
#' result <- financial_news(api_token, s, t, from_date, to_date, limit, offset)
#'
#' @export

financial_news <- function(api_token, s = NULL, t = NULL, from_date = NULL, to_date = NULL, limit = NULL, offset = NULL) {
  possible_tags <- c('balance sheet', 'capital employed', 'class action', 'company announcement',
                     'consensus eps estimate', 'consensus estimate', 'credit rating',
                     'discounted cash flow', 'dividend payments', 'earnings estimate',
                     'earnings growth', 'earnings per share', 'earnings release', 'earnings report',
                     'earnings results', 'earnings surprise', 'estimate revisions', 'european regulatory news',
                     'financial results', 'fourth quarter', 'free cash flow', 'future cash flows',
                     'growth rate', 'initial public offering', 'insider ownership', 'insider transactions',
                     'institutional investors', 'institutional ownership', 'intrinsic value',
                     'market research reports', 'net income', 'operating income', 'present value',
                     'press releases', 'price target', 'quarterly earnings', 'quarterly results',
                     'ratings', 'research analysis and reports', 'return on equity', 'revenue estimates',
                     'revenue growth', 'roce', 'roe', 'share price', 'shareholder rights', 'shareholder',
                     'shares outstanding', 'strong buy', 'total revenue', 'zacks investment research', 'zacks rank')

  endpoint <- 'news'
  query_string <- list()

  if (is.null(t) && is.null(s)) {
    stop("s or t is empty. You need to add s or t to args")
  } else if (!is.null(t) && !is.null(s)) {
    query_string$s <- as.character(s)
  } else if (!is.null(s) && is.null(t)) {
    query_string$s <- as.character(s)
  } else {
    if (t %in% possible_tags) {
      query_string$t <- as.character(t)
    } else {
      stop("Incorrect value was fulfilled for s or t")
    }
  }

  if (!is.null(limit)) {
    query_string$limit <- as.character(limit)
  }
  if (!is.null(offset)) {
    query_string$offset <- as.character(offset)
  }
  if (!is.null(from_date)) {
    query_string$from_date <- as.character(from_date)
  }
  if (!is.null(to_date)) {
    query_string$to_date <- as.character(to_date)
  }

  return(rest_get_method(api_key = api_token, endpoint = endpoint, querystring = query_string))
}
