resource "google_spanner_instance" "compliant_example_1" {
  name         = "c-instance"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance C"
  num_nodes    = 1
  force_destroy = false
}
