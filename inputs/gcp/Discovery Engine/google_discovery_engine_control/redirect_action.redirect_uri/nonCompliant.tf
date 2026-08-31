# Describe your resource type here
# engine_control_redirect

resource "google_discovery_engine_control" "non_compliant_example_1" {
project = "735927692082"
  location       = "global"
  engine_id      = "engine-id"
  control_id     = "non_compliant_example_1"
  display_name   = "c-control"
  solution_type  = "SOLUTION_TYPE_SEARCH"
  use_cases      = ["SEARCH_USE_CASE_SEARCH"]

  #synonyms_action

  redirect_action {
    redirect_uri = "https://badexample.com/special-landing-page"
  }
 }
