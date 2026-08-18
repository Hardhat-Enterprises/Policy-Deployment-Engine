resource "google_bigquery_data_transfer_config" "non_compliant_example_1" {
  project                = "CH-project"
  display_name           = "non_compliant_example_1"
  data_source_id         = "scheduled_query"
  destination_dataset_id = "test"
  location               = "us-central1"

  params = {
    query = "SELECT CURRENT_DATE()"
    destination_table_name_template = "sample_output"
    write_disposition               = "WRITE_TRUNCATE"
  }

  service_account_name = "service-1234567890@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"
}
