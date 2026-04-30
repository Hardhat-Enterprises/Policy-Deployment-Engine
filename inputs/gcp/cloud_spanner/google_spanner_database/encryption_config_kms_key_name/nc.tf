resource "google_spanner_database" "nc1" {
  instance = "example-instance"
  name     = "nc1"
  encryption_config {
    kms_key_name = ""
  }
}
