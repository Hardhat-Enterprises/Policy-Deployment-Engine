resource "google_bigquery_data_transfer_config" "NC" {
  project                = "my_project_id"
  display_name           = "Chhunly Data Transfer"
  data_source_id         = "scheduled_query"
  destination_dataset_id = "my_dataset"
  schedule               = "every 24 hours"
  location               = "us-central1"

  params = {
    query = "SELECT CURRENT_DATE()"
    destination_table_name_template = "sample_output"
    write_disposition               = "WRITE_TRUNCATE"
  }

  service_account_name = "service-1234567890@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"
}