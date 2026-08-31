resource "google_chronicle_watchlist" "non_compliant_example_1" {
  project            = "fake-project"
  location           = "australia-southeast1"
  instance           = "00000000-0000-0000-0000-000000000000"
  watchlist_id       = "non_compliant_example_1"
  description        = "Critical assets"
  display_name       = "Secure Watchlist"
  multiplying_factor = 0.3

  entity_population_mechanism {
    manual {}
  }

  watchlist_user_preferences {
    pinned = true
  }
}
