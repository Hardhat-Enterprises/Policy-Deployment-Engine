# Discovery Engine control that permits deletion.

resource "google_discovery_engine_control" "non_compliant_example_1" {
  project         = "735927692082"
  location        = "global"
  engine_id       = "engine-id"
  control_id      = "non_compliant_example_1"
  display_name    = "Protected control"
  solution_type   = "SOLUTION_TYPE_SEARCH"
  use_cases       = ["SEARCH_USE_CASE_SEARCH"]
  deletion_policy = "DELETE"

  redirect_action {
    redirect_uri = "https://goodexample.com/special-landing-page"
  }
}
