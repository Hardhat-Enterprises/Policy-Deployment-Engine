resource "google_bigtable_table" "compliant_example_1" {
  project       = "PDE"
  name          = "compliant_example_1"
  instance_name = "c"

  automated_backup_policy {
    retention_period = "72h"
    frequency        = "24h"
  }
}
