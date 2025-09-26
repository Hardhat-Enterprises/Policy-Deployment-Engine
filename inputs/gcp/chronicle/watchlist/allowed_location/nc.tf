resource "google_chronicle_watchlist" "nc" {
  project       ="fake-project"  
  location      = "canada"
  instance      = "00000000-0000-0000-0000-000000000000"
  watchlist_id  = "nc"
  description   = "Compliant watchlist using non-manual population"
  display_name  = "sec-auto-watchlist"
  multiplying_factor = 1

  entity_population_mechanism {
    
  }

  watchlist_user_preferences {
    pinned = true
  }
}
