resource "google_bigtable_table" "non_compliant_example_1" {
  project       = "PDE"
  name          = "non_compliant_example_1"
  instance_name = "c"
}

resource "google_bigtable_table" "non_compliant_example_2" {
  project       = "PDE"
  name          = "non_compliant_example_2"
  instance_name = "c"

  automated_backup_policy {
    retention_period = "0"
    frequency        = "24h"
  }
}

resource "google_bigtable_table" "non_compliant_example_3" {
  project       = "PDE"
  name          = "non_compliant_example_3"
  instance_name = "c"

  automated_backup_policy {
    retention_period = "72h"
    frequency        = "0"
  }
}
