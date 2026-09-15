resource "google_dataplex_entry_group" "compliant_example_1" {
  entry_group_id   = "compliant-example_1"
  project          = "compliant_example_1"
  location         = "australia-southeast1"
  deletion_policy  = "PREVENT"
}