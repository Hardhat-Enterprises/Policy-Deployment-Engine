resource "google_chronicle_watchlist" "nc" {
  project       = "fake-project"  
  location      = "us"
  instance      = "00000000-0000-0000-0000-000000000000"
  watchlist_id  = "low-risk-watchlist"
  description   = "Watchlist with too low multiplier"
  display_name  = "Low Risk List"
  multiplying_factor = 0.3

  entity_population_mechanism {
    manual {}
  }

  watchlist_user_preferences {
    pinned = false
  }
}
