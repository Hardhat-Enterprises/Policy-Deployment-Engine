resource "google_spanner_instance" "non_compliant_example_1" {
  name         = "nc-instance"
  config       = "regional-australia-southeast1"
  display_name = "non_compliant_example_1"
  num_nodes    = 1
  force_destroy = true
}
