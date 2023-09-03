library(testthat)
source("../R/EarningTrendsAPI.R")

test_that("get_earning_trends_data returns expected results", {
  api_token <- "demo" 
  symbols = 'AAPL.US'
  
  result <- get_earning_trends_data(api_token = api_token, symbols = symbols)
  
  expect_is(result, "list")
  
  expect_true("symbols" %in% names(result))
  expect_true("trends" %in% names(result))
})
