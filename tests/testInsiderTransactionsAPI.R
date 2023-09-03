library(testthat)
source("../R/InsiderTransactionsAPI.R")

test_that("get_insider_transactions_data returns expected results", {
  api_token <- "demo" 
  code <- "AAPL.US"
  date_from = "2017-09-10"
  date_to = "2017-09-12"
  limit <- "100"
  
  result <- get_insider_transactions_data(api_token = api_token, code = code, limit = limit, date_from = date_from, date_to = date_to)
  expect_is(result, "list")

  expect_true("error" %in% names(result))
  
})