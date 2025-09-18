resource "google_bigquery_data_transfer_config" "nc" {
  project                = "CH-project"
  display_name           = "nc"
  data_source_id         = "scheduled_query"
  destination_dataset_id = "my_dataset"
  schedule               = "every 24 hours"

  service_account_name = "service-1234567890@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"

   encryption_configuration {kms_key_name = ""}

  params = {
    query                            = "SELECT 'insecure';"
    destination_table_name_template  = "bad_table_$${run_time}"
    write_disposition                = "WRITE_APPEND"
  }
}