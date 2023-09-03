library(testthat)
source("../R/HistoricalDividendsAPI.R")

test_that("get_historical_dividends_data returns expected results", {
  api_token <- "demo" 
  ticker <- "AAPL.US"
  date_from = "2017-09-10"
  date_to = "2017-09-12"
  
  result <- get_historical_dividends_data(api_token = api_token, ticker = ticker, date_from = date_from, date_to = date_to)
  expect_is(result, "list")

  check_result = result[[1]]
  expect_true("date" %in% names(check_result))
  expect_true("value" %in% names(check_result))
  expect_true("currency" %in% names(check_result))
  
})