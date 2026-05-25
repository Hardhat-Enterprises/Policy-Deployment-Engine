resource "google_spanner_instance" "nc" {
  name         = "test-instance-nc"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance NC"
  num_nodes    = 1
  force_destroy = true
}
