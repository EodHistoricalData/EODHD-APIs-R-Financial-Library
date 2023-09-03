library(testthat)
source("../R/ListOfExchangerAPI.R")

test_that("get_list_of_exchanges returns expected results", {
  api_token <- "demo" 
  
  result <- get_list_of_exchanges(api_token = api_token)
  expect_is(result, "list")

  expect_true("error" %in% names(result))
  
})