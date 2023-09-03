library(testthat)
source("../R/BondsFundamentalsAPI.R")


test_that("get_bonds_fundamentals_data returns expected results", {
  api_token <- "demo" 
  isin <- "DE000CB83CF0"
  
  result <- get_bonds_fundamentals_data(api_token, isin)
  
  expect_is(result, "list")
  
  expect_true("error" %in% names(result))
})

