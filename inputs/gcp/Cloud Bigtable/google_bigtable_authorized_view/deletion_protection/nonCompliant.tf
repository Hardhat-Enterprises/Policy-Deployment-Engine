resource "google_bigtable_authorized_view" "non_compliant_example_1" {
  project       = "PDE"
  name          = "non_compliant_example_1"
  instance_name = "nc"
  table_name    = "t"

  deletion_protection = "UNPROTECTED"

  subset_view {
    row_prefixes = [base64encode("")]
  }
}
