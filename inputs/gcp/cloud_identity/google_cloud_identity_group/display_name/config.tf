provider "google" {
  project = "test-project"
  region  = "us-central1"

  # Disable auth requirement for testing
  access_token = "dummy"
}