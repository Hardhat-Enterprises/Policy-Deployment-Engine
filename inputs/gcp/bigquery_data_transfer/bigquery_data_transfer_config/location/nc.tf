resource "google_bigquery_data_transfer_config" "nc" {
  display_name           = "nc"
  data_source_id         = "scheduled_query"
  location               = "asia-east1"  
  schedule               = "first sunday of quarter 00:00"
  destination_dataset_id = "my_dataset"
  project                = "CH-project"

  params = {
    query            = "SELECT CURRENT_DATE();"
    destination_table_name_template = "daily_summary"
    write_disposition = "WRITE_TRUNCATE"
  }
}