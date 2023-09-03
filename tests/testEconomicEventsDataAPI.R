library(testthat)
source("../R/EconomicEventsDataAPI.R")

test_that("get_economic_events_data returns expected results", {
  api_token <- "demo" 
  date_from <- '2017-09-10'
  date_to <- '2017-09-12'
  country <- 'US'
  comparison <- 'qoq'
  offset <- '0'
  limit <- '50'
  
  result <- get_economic_events_data(api_token = api_token, date_from = date_from, date_to = date_to,
                                     country = country, comparison = comparison, offset = offset, limit = limit)
  
  expect_is(result, "list")
  
  expect_true("error" %in% names(result))
})
