resource "google_spanner_instance" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  config       = "regional-us-central1"
  display_name = "Test Instance NC"
  num_nodes    = 1
}
