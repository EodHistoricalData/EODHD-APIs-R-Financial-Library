library(testthat)
source("../R/TechnicalIndicatorAPI.R")

test_that("get_technical_indicator_data expected results", {

  
  api_token <- "demo"
  ticker <- "AAPL.US"
  func <- "sma"
  period <- "100"
  date_from <- "2017-09-10"
  date_to <- "2017-09-12"
  order <- "d"
  splitadjusted_only <- "1"
  
  result <- get_technical_indicator_data(api_token = api_token, ticker = ticker, func = func, period = period, 
                                            date_from = date_from, date_to = date_to, order = order, 
                                            splitadjusted_only = splitadjusted_only)
  
  expect_is(result, "list")

  check_result = result[[1]]

  expect_true("date" %in% names(check_result))
  expect_true(func %in% names(check_result))
})