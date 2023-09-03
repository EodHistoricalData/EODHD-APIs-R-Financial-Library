library(testthat)
source("../R/BaseAPI.R")
help(rest_get_method)
test_that("rest_get_method returns expected results", {
  api_token <- "demo" 
  endpoint = 'calendar/trends'

  querystring = list()
  querystring$symbols = 'AAPL.US'
  
  result <- rest_get_method(api_key = api_token, querystring = querystring, endpoint = endpoint)
  
  expect_is(result, "list")
  
  expect_true("symbols" %in% names(result))
  expect_true("trends" %in% names(result))
})
