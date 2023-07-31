source("./BondsFundamentalsAPI.R")

api_token <- "64bce94f81ae02.82666688"
isin <- "DE000CB83CF0"

result <- get_bonds_fundamentals_data(api_token = api_token, isin = isin)

print(result)
