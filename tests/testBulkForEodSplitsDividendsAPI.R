library(testthat)
source("../R/BulkForEodSplitsDividendsAPI.R")


test_that("get_bulk_eod_splits_dividends_data returns expected results", {
  api_token <- "demo" 
  country <- "US"
  date <- '2010-09-21'
  symbols <- 'MSFT'
  filter <- 'extended'
  type <- 'splits'
  
  result <- get_bulk_eod_splits_dividends_data(api_token = api_token, country = country, type = type, date = date,
                                      symbols = symbols, filter = filter)
  
  expect_is(result, "list")
  
  expect_true("error" %in% names(result))
})


