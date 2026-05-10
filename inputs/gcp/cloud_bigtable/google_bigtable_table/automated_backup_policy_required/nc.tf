resource "google_bigtable_table" "nc" {
  project       = "PDE"
  name          = "nc"
  instance_name = "nc"
}

resource "google_bigtable_table" "nc2" {
  project       = "PDE"
  name          = "nc2"
  instance_name = "nc2"

  automated_backup_policy {
    retention_period = "0"
    frequency        = "24h"
  }
}

resource "google_bigtable_table" "nc3" {
  project       = "PDE"
  name          = "nc3"
  instance_name = "nc3"

  automated_backup_policy {
    retention_period = "72h"
    frequency        = "0"
  }
}
