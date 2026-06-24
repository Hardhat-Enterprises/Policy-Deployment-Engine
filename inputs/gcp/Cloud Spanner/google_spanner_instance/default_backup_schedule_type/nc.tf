resource "google_spanner_instance" "nc" {
  name                         = "nc"
  config                       = "regional-australia-southeast1"
  display_name                 = "Test Instance NC"
  num_nodes                    = 1
  default_backup_schedule_type = "NONE"
}
