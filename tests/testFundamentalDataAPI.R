library(testthat)
source("../R/FundamentalDataAPI.R")

test_that("get_fundamentals_data returns expected results", {
  api_token <- "demo" 
  ticker <- "AAPL.US"
  
  result <- get_fundamentals_data(api_token = api_token, ticker = ticker)
  
  expect_is(result, "list")
  
  expect_true("General" %in% names(result))
})