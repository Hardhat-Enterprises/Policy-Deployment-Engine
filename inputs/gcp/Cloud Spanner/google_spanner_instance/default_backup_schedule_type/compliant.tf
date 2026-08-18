resource "google_spanner_instance" "compliant_example_1" {
  name                         = "c-instance"
  config                       = "regional-australia-southeast1"
  display_name                 = "compliant_example_1"
  num_nodes                    = 1
  default_backup_schedule_type = "AUTOMATIC"
}
