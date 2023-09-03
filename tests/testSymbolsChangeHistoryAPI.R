library(testthat)
source("../R/SymbolsChangeHistoryAPI.R")

symbol_change_history(api_token = '648c5634774904.84425632', from_date = "2017-09-10", to_date = "2017-09-12")

test_that("symbol_change_history expected results", {

  api_token <- "demo"
  from_date <- "2017-09-10"
  to_date <- "2017-09-12"
  
  result <- symbol_change_history(api_token = api_token, from_date = from_date, to_date = to_date)
  
  expect_is(result, "list")

  expect_true("error" %in% names(result))
})