resource "google_chronicle_watchlist" "nc" {
  project       = "fake-project"  
  location      = "australia-southeast1"
  instance      = "00000000-0000-0000-0000-000000000000"
  watchlist_id  = "nc"
  description   = "Non-compliant watchlist with manual entity population"
  display_name  = "manual-watchlist"
  multiplying_factor = 1

  entity_population_mechanism {
    manual {}
  }

  watchlist_user_preferences {
    pinned = false
  }
}
