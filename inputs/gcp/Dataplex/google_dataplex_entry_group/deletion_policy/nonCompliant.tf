resource "google_dataplex_entry_group" "non_compliant_example_1" {
  entry_group_id   = "non-compliant-example_1"
  project          = "non_compliant_example_1"
  location         = "us-west1"
  deletion_policy  = "DELETE"
}