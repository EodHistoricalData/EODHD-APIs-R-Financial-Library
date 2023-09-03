library(testthat)
source("../R/UpcomingEarningsAPI.R")

test_that("get_upcoming_earnings_data expected results", {

  api_token <- "demo"
  from_date <- "2017-09-10"
  to_date <- "2017-09-12"
  symbols <- "MS"
  
  result <- get_upcoming_earnings_data(api_token = api_token, from_date = from_date, 
                                                            to_date = to_date, symbols = symbols)
  
  expect_is(result, "list")

  expect_true("error" %in% names(result))
})