resource "google_composer_environment" "nc" {
  name    = "nc"
  region  = "us-central1"
  project = "fake-project"

  config {
    software_config {
      env_variables = {
        DB_PASSWORD = "DB_PASSWORD"
      }
    }
  }
}