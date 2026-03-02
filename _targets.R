
library(targets)
library(tarchetypes) # Load other packages as needed.


tar_option_set(
  packages = c("tibble", "dplyr", "httr2", "purrr", "stringr", "readr")
)

tar_source()

tar_plan(
  
  # Download and prepare card list
  
  api_url = "https://api.scryfall.com/cards/search",
  
  req = request(api_url) %>% 
    req_url_query(
      q = "block:isd",
      order = "set",
      unique = "cards"
    ) %>% 
    req_throttle(rate = 10) %>% 
    req_retry(max_tries = 3),
  cards_list = fetch_cards(req),
  
  cards_df = map_dfr(cards_list, parse_cards),
  
  cards = format_cards(cards_df),
  
  saved = write_csv(cards, "cards.csv")
  
)

