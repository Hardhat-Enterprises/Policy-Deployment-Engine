resource "google_spanner_instance" "c1" {
  name         = "c1"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance C1"
  num_nodes    = 1
  force_destroy = false
}
