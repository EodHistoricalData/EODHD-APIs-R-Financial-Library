library(testthat)
source("../R/OptionsDataAPI.R")


test_that("get_options_data returns expected results", {
  api_token <- "demo" 
  ticker <- "AAPL.US"
  date_to <- "2017-09-10"
  date_from <- "2017-09-12"
  trade_date_to <- "2010-05-15"
  trade_date_from <- "2010-05-16"
  contract_name <- "AAPL230818C00055000"

  
  result <- get_options_data(api_token = api_token, date_to = date_to, date_from = date_from, trade_date_to = trade_date_to, 
                            trade_date_from = trade_date_from, contract_name = contract_name, ticker = ticker)
  
  expect_is(result, "list")
  
  expect_true("code" %in% names(result))
  expect_true("data" %in% names(result))
  expect_true("exchange" %in% names(result))
})