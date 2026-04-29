resource "google_bigtable_authorized_view" "c" {
  project       = "PDE"
  name          = "c"
  instance_name = "c"
  table_name    = "t"

  subset_view {
    family_subsets {
      family_name        = "cf1"
      qualifier_prefixes = [base64encode("user_")]
    }
  }
}
