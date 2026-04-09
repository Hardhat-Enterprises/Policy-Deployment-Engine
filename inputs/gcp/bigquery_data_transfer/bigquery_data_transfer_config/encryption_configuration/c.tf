resource "google_bigquery_data_transfer_config" "c" {
  project                = "CH-project"
  display_name           = "c"
  data_source_id         = "scheduled_query"
  destination_dataset_id = "my_dataset"
  schedule               = "every 24 hours"

  service_account_name = "service-1234567890@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"

  encryption_configuration {
    kms_key_name = "projects/your-project-id/locations/global/keyRings/your-keyring/cryptoKeys/your-key"
  }

  params = {
    query                           = "SELECT CURRENT_DATE()"
    destination_table_name_template = "my_table_$${run_time}"
    write_disposition               = "WRITE_TRUNCATE"
  }
}