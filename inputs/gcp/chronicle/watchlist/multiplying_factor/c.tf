resource "google_chronicle_watchlist" "c" {
  project = "fake-project"
  location      = "australia-southeast1"
  instance      = "00000000-0000-0000-0000-000000000000"
  watchlist_id  = "c"
  description   = "Critical assets"
  display_name  = "Secure Watchlist"
  multiplying_factor = 1.5

  entity_population_mechanism {
    manual {}
  }

  watchlist_user_preferences {
    pinned = true
  }
}

