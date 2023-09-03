library(testthat)
source("../R/UpcomingSplitsAPI.R")

test_that("get_upcoming_splits_data expected results", {

  api_token <- "demo"
  from_date <- "2017-09-10"
  to_date <- "2017-09-12"
  
  result <- get_upcoming_splits_data(api_token = api_token, from_date = from_date, 
                                                            to_date = to_date)
  
  expect_is(result, "list")

  expect_true("error" %in% names(result))
})