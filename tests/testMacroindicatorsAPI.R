library(testthat)
source("../R/MacroindicatorsAPI.R")


test_that("get_macro_indicators_data returns expected results", {
  api_token <- "demo" 
  country <- "US"
  indicator <- 'gdp_current_usd'
  
  result <- get_macro_indicators_data(api_token = api_token, country = country, indicator = indicator)
  
  expect_is(result, "list")
  
  expect_true("error" %in% names(result))
})