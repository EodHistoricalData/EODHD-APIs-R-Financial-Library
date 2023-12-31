% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MacroindicatorsAPI.R
\name{get_macro_indicators_data}
\alias{get_macro_indicators_data}
\title{Get macro indicators data}
\usage{
get_macro_indicators_data(api_token, country, indicator = NULL)
}
\arguments{
\item{api_token}{The API token for authentication.}

\item{country}{Defines the country for which the indicator will be shown. The country should be defined in the Alpha-3 ISO format.}

\item{indicator}{Defines which macroeconomics data indicator will be shown. All possible indicators will be avaliable on: https://eodhistoricaldata.com/financial-apis/macroeconomics-data-and-macro-indicators-api/}
}
\value{
A list containing the macro indicators data.
}
\description{
This function retrieves macro indicators data from the API.
}
\examples{
api_token <- "demo"
country <- "USA"
indicator <- "gdp_current_usd"
result <- get_macro_indicators_data(api_token, country, indicator)

}
