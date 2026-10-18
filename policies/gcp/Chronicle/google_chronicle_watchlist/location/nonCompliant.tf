resource "google_chronicle_watchlist" "non_compliant_example_1" {
  project            = "fake-project"
  location           = "canada"
  instance           = "00000000-0000-0000-0000-000000000000"
  watchlist_id       = "non_compliant_example_1"
  description        = "Compliant watchlist using non-manual population"
  display_name       = "sec-auto-watchlist"
  multiplying_factor = 1

  entity_population_mechanism {

  }

  watchlist_user_preferences {
    pinned = true
  }
}
