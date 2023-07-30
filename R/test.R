source("./BondsFundamentalsAPI.R")

api_token <- "demo"
isin <- "DE000CB83CF0"

result <- get_bonds_fundamentals_data(api_token = api_token, isin = isin)

print(result)
