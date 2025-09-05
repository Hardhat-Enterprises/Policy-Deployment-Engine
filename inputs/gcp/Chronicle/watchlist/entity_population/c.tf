resource "google_chronicle_watchlist" "c" {
  project       ="fake-project"  
  location      = "us"
  instance      = "00000000-0000-0000-0000-000000000000"
  watchlist_id  = "auto-populated-watchlist -c"
  description   = "Compliant watchlist using non-manual population"
  display_name  = "sec-auto-watchlist"
  multiplying_factor = 1

  entity_population_mechanism {
    
  }

  watchlist_user_preferences {
    pinned = true
  }
}
