resource "google_dataplex_entry" "compliant_example_1" {
  entry_group_id = "@bigquery"
  project        = "compliant_example_1"
  location       = "australia-southeast1"
  entry_id       = "entry-basic"

  entry_type = "projects/655216118709/locations/global/entryTypes/bigquery-table"
}