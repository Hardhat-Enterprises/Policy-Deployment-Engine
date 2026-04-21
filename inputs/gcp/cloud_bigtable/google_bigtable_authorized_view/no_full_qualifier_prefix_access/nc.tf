resource "google_bigtable_authorized_view" "nc" {
  project       = "PDE"
  name          = "nc"
  instance_name = "nc"
  table_name    = "t"

  subset_view {
    family_subsets {
      family_name        = "cf1"
      qualifier_prefixes = [""]
    }
  }
}
