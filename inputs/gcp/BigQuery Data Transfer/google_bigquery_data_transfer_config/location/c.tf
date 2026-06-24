resource "google_bigquery_data_transfer_config" "c" {
  display_name           = "c"
  location               = "australia-southeast1"
  data_source_id         = "scheduled_query"
  schedule               = "first sunday of quarter 00:00"
  destination_dataset_id = "my_dataset"
  project                = "CH-project"

  params = {
    destination_table_name_template = "my_table"
    write_disposition               = "WRITE_APPEND"
    query                           = "SELECT name FROM tabl WHERE x = 'y'"
  }
}