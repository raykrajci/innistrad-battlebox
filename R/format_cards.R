format_cards <- function(cards) {
  # is <- function(column, transform_column, pattern){
  #   map_lgl(column, \(x) !is.na(x) & str_detect(x, pattern)) |
  #   map_lgl(transform_column, \(x) !is.na(x) & str_detect(x, pattern))
  # }

  cards %>%
    mutate(quantity = 0) %>% 
    relocate(quantity) # %>%
  # mutate(type_creature = is(type_line, transform_type_line, "Creature"),
  #        type_instant_sorcery = is(type_line, transform_type_line, "Instant|Sorcery"),
  #        type_enchantment = is(type_line, transform_type_line, "Enchantment"),
  #        type_artifact = is(type_line, transform_type_line, "Artifact"),
  #        type_human = is(type_line, transform_type_line, "Human"),
  #        type_vampire = is(type_line, transform_type_line, "Vampire"),
  #        type_spirit = is(type_line, transform_type_line, "Spirit"),
  #        type_werewolf = is(type_line, transform_type_line, "Werewolf"),
  #        type_zombie = is(type_line, transform_type_line, "Zombie"),
  #        type_curse = is(type_line, transform_type_line, "Curse"))
}