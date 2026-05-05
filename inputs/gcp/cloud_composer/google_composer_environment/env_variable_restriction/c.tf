resource "google_composer_environment" "c" {
  name    = "c"
  region  = "australia-southeast1"
  project = "fake-project"

  config {
    software_config {
      env_variables = {
        DB_PASSWORD = "prod"
      }
    }
  }
}