# Discovery Engine control in a non-approved location.

resource "google_discovery_engine_control" "non_compliant_example_1" {
  project       = "735927692082"
  location      = "global"
  engine_id     = "engine-id"
  control_id    = "non-compliant-example-1"
  display_name  = "Example control"
  solution_type = "SOLUTION_TYPE_SEARCH"
  use_cases     = ["SEARCH_USE_CASE_SEARCH"]

  redirect_action {
    redirect_uri = "https://goodexample.com/special-landing-page"
  }
}