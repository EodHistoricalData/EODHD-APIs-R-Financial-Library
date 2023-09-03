library(testthat)
source("../R/FinancialNewsAPI.R")

test_that("financial_news returns expected results", {
  api_token <- "demo" 
  s <- "balance sheet"
  from_date <- '2017-09-10'
  to_date <- '2017-09-12'
  limit <- '5'
  offset <- '10'
  
  result <- financial_news(api_token = api_token, s = s, from_date = from_date, 
                        to_date = to_date, limit = limit, offset = offset)
  
  expect_is(result, "list")
  
  check_result = result[[1]]
  expect_true("title" %in% names(check_result))
  expect_true("content" %in% names(check_result))
  expect_true("symbols" %in% names(check_result))
})
