resource "google_composer_user_workloads_config_map" "c" {
  name        = "c"
  project     = "fake-project"
  region      = "australia-southeast1"
  environment = "my-actual-environment-name" # The literal name
  data = {
    api_host = "apihost:443"
  }
}