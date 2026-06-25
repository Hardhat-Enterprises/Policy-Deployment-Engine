resource "google_bigtable_authorized_view" "compliant_example_1" {
  project       = "PDE"
  name          = "compliant_example_1"
  instance_name = "c"
  table_name    = "t"

  subset_view {
    row_prefixes = [base64encode("user_")]
  }
}
