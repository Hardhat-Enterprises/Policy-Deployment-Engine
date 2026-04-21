resource "google_bigtable_authorized_view" "nc" {
  project       = "PDE"
  name          = "nc"
  instance_name = "nc"
  table_name    = "t"

  deletion_protection = "UNPROTECTED"

  subset_view {
    row_prefixes = [""]
  }
}
