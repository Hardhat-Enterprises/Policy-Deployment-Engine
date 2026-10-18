# Promotion using an approved HTTPS image.

resource "google_discovery_engine_control" "compliant_example_1" {
  project         = "735927692082"
  location        = "us"
  engine_id       = "engine-id"
  control_id      = "compliant_example_1"
  display_name    = "Approved-image promotion"
  solution_type   = "SOLUTION_TYPE_SEARCH"
  use_cases       = ["SEARCH_USE_CASE_SEARCH"]
  deletion_policy = "PREVENT"

  promote_action {
    data_store = "data-store-id"

    search_link_promotion {
      title     = "Approved promotion"
      uri       = "https://goodexample.com/promotion"
      image_uri = "https://images.goodexample.com/promotion.png"
    }
  }
}
