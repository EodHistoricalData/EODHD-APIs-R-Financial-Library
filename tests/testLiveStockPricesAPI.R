library(testthat)
source("../R/LiveStockPricesAPI.R")

test_that("get_live_stock_prices returns expected results", {
  api_token <- "demo" 
  ticker <- "AAPL.US"
  s <- "VTI,EUR.FOREX"
  
  result <- get_live_stock_prices(api_token = api_token, ticker = ticker, s = s)
  expect_is(result, "list")

  check_result = result[[1]]
  expect_true("code" %in% names(check_result))
  expect_true("high" %in% names(check_result))
  expect_true("low" %in% names(check_result))

})