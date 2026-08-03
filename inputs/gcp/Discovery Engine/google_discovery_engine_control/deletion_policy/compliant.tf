# Discovery Engine control protected from accidental deletion.

resource "google_discovery_engine_control" "compliant_example_1" {
  project         = "735927692082"
  location        = "global"
  engine_id       = "engine-id"
  control_id      = "compliant-example-1"
  display_name    = "Protected control"
  solution_type   = "SOLUTION_TYPE_SEARCH"
  use_cases       = ["SEARCH_USE_CASE_SEARCH"]
  deletion_policy = "PREVENT"

  redirect_action {
    redirect_uri = "https://goodexample.com/special-landing-page"
  }
}