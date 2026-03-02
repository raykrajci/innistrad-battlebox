fetch_cards <- function(initial_req){
  
  cards_list <- list()
  
  resp <- req_perform(initial_req)
  body <- resp_body_json(resp)
  
  cards_list <- c(cards_list, body$data)
  
  while(isTRUE(body$has_more)) {
    resp <- request(body$next_page) |> 
      req_throttle(rate = 10) |> 
      req_retry(max_tries = 3) |> 
      req_perform()
    body <- resp_body_json(resp)
    cards_list <- c(cards_list, body$data)
  }
  
  return(cards_list)
  
}