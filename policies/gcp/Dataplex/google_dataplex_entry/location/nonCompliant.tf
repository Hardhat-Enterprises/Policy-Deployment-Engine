resource "google_dataplex_entry" "non_compliant_example_1" {
  entry_group_id = "@bigquery"
  project        = "non_compliant_example_1"
  location       = "us-central1"
  entry_id       = "entry-basic"

  entry_type = "projects/655216118709/locations/global/entryTypes/bigquery-table"
}