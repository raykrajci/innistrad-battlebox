parse_cards <- function(card) {
  
  tibble(
    name = pluck(card, "card_faces", 1, "name", .default = card$name),
    colors = pluck(card, "colors", .default = pluck(card, "card_faces", 1, "colors")) %>% paste0(collapse = "") %>% na_if(""),
    cmc = pluck(card, "cmc", .default = NA) %>% as.integer(),
    mana_cost = pluck(card, "mana_cost", .default = pluck(card, "card_faces", 1, "mana_cost", .default = NA_character_)) %>% na_if(""),
    type_line = pluck(card, "card_faces", 1, "type_line", .default = pluck(card, "type_line", .default = NA_character_)),
    oracle_text = pluck(card, "oracle_text", .default = pluck(card, "card_faces", 1, "oracle_text", .default = NA_character_)),
    power = pluck(card, "power", .default = pluck(card, "card_faces", 1, "power", .default = NA)) %>% as.integer(),
    toughness = pluck(card, "toughness", .default = NA) %>% as.integer(),
    transform_name = pluck(card, "card_faces", 2, "name", .default = NA_character_),
    transform_type_line = pluck(card, "card_faces", 2, "type_line", .default = NA_character_),
    transform_oracle_text = pluck(card, "card_faces", 2, "oracle_text", .default = NA_character_),
    transform_power = pluck(card, "card_faces", 2, "power", .default = NA) %>% as.integer(),
    transform_toughness = pluck(card, "card_faces", 2, "toughness", .default = NA) %>% as.integer(),
    rarity = pluck(card, "rarity", .default = NA),
    set = pluck(card, "set", .default = NA),
    scryfall_api = pluck(card, "uri", .default = NA),
    scryfall_url = pluck(card, "scryfall_uri", .default = NA)
  )
}