resource "google_bigtable_authorized_view" "c" {
  project       = "PDE"
  name          = "c"
  instance_name = "c"
  table_name    = "t"

  subset_view {
    row_prefixes = ["user_"]
  }
}
