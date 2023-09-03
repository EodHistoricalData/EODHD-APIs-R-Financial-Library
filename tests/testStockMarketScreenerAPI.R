library(testthat)
source("../R/StockMarketScreenerAPI.R")


test_that("stock_market_screener expected results", {
  api_token <- "demo"
  sort <- "market_capitalization.desc"
  filters <- '[["market_capitalization",">",1000],["name","match","apple"],["code","=","AAPL"],["exchange","=","us"],["sector","=","Technology"]]'
  limit <- "1"
  offset <- "50"
  trade_date_from <- "2010-05-16"
  contract_name <- "AAPL230818C00055000"
  signals <- "bookvalue_neg"

  
  result <- result <- stock_market_screener(api_token = api_token, sort = sort, filters = filters, limit = limit, offset = offset)
  
  expect_is(result, "list")
  
  expect_true("error" %in% names(result))
})