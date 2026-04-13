resource "google_composer_user_workloads_config_map" "nc" {
  name        = "nc"
  project     = "fake-project"
  region      = "us-central1"
  environment = "my-actual-environment-name" # The literal name
  data = {
    api_host = "apihost:443"
  }
}