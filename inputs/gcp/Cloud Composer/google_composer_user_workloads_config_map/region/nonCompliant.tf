resource "google_composer_user_workloads_config_map" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  project     = "fake-project"
  region      = "us-central1"
  environment = "my-actual-environment-name" # The literal name
  data = {
    api_host = "apihost:443"
  }
}
