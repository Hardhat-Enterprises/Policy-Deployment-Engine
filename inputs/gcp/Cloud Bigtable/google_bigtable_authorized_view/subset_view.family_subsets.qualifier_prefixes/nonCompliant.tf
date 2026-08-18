resource "google_bigtable_authorized_view" "non_compliant_example_1" {
  project       = "PDE"
  name          = "non_compliant_example_1"
  instance_name = "nc"
  table_name    = "t"

  subset_view {
    family_subsets {
      family_name        = "cf1"
      qualifier_prefixes = [base64encode("")]
    }
  }
}
