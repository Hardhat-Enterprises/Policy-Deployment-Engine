resource "google_spanner_instance" "nc1" {
  name         = "test-instance-nc1"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance NC1"
  num_nodes    = 1
  force_destroy = true
}
