resource "google_spanner_instance" "c" {
  name         = "c-instance"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance C"
  num_nodes    = 1
  force_destroy = false
}
