library(testthat)
source("../R/TradingHoursStockMarketHolidaysAPI.R")

test_that("get_details_trading_hours_stock_market_holidays expected results", {

  api_token <- "demo"
  from_date <- "2017-09-10"
  to_date <- "2017-09-12"
  code <- "US"
  
  result <- get_details_trading_hours_stock_market_holidays(api_token = api_token, from_date = from_date, 
                                                            to_date = to_date, code = code)
  
  expect_is(result, "list")

  expect_true("error" %in% names(result))
})