resource "google_bigquery_data_transfer_config" "nc" {

  project                = "my_project_id"
  display_name           = "Not BQ Transfer"
  data_source_id         = "scheduled_query"
  destination_dataset_id = "my_dataset"
  schedule               = "every 24 hours"

  service_account_name = "service-1234567890@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"

  params = {
    query                            = "SELECT 'insecure';"
    destination_table_name_template  = "bad_table_$${run_time}"
    write_disposition                = "WRITE_APPEND"
  }
}