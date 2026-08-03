# Promotion using an unapproved destination URI.

resource "google_discovery_engine_control" "non_compliant_example_1" {
  project         = "735927692082"
  location        = "us"
  engine_id       = "engine-id"
  control_id      = "non-compliant-example-1"
  display_name    = "Unapproved-link promotion"
  solution_type   = "SOLUTION_TYPE_SEARCH"
  use_cases       = ["SEARCH_USE_CASE_SEARCH"]
  deletion_policy = "PREVENT"

  promote_action {
    data_store = "data-store-id"

    search_link_promotion {
      title     = "Unapproved promotion"
      uri       = "http://untrusted.example.com/promotion"
      image_uri = "https://images.goodexample.com/promotion.png"
    }
  }
}