resource "google_bigtable_table" "c" {
  project       = "PDE"
  name          = "c"
  instance_name = "c"

  automated_backup_policy {
    retention_period = "72h"
    frequency        = "24h"
  }
}
