resource "google_spanner_instance" "non_compliant_example_1" {
  name                         = "non_compliant_example_1"
  config                       = "regional-australia-southeast1"
  display_name                 = "Test Instance NC"
  num_nodes                    = 1
  default_backup_schedule_type = "NONE"
}
