% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BulkForEodSplitsDividendsAPI.R
\name{get_bulk_eod_splits_dividends_data}
\alias{get_bulk_eod_splits_dividends_data}
\title{Get bulk fundamentals data}
\usage{
get_bulk_eod_splits_dividends_data(
  api_token,
  country = "US",
  type = NULL,
  date = NULL,
  symbols = NULL,
  filter = NULL
)
}
\arguments{
\item{api_token}{The API token for authentication.}

\item{country}{<- 'US'}

\item{type}{<- can be empty, splits or dividends}

\item{date}{By default, the data for last trading day will be downloaded, but if you need any specific date, add ‘date’ parameter to the URL}

\item{symbols}{To download last day data for several symbols, for example, for MSFT and AAPL, you can add the ‘symbols’ parameter}

\item{filter}{If you need more data, like company name, you can use ‘&filter=extended’}
}
\value{
A list containing bulk fundamentals data.
}
\description{
This function retrieves bulk fundamentals data from the API.
}
\examples{
api_token <- "demo"
country <- 'US'
type <- 'splits'
date <- "2010-09-21"
symbols <- "MSFT"
filter <- "extended"
result <- get_bulk_eod_splits_dividends_data(api_token, country, type, date, symbols, filter)

}
