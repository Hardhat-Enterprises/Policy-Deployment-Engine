resource "google_spanner_instance" "nc" {
  name         = "nc"
  config       = "regional-us-central1"
  display_name = "Test Instance NC"
  num_nodes    = 1
}
