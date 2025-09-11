resource "google_bigquery_data_transfer_config" "nc" {
  project                = "civil-lightning-468910-m1"
  display_name           = "Noncompliant Amazon S3 Transfer"
  data_source_id         = "amazon_s3"
  destination_dataset_id = "insecure_dataset"
  schedule               = "every 24 hours"
  service_account_name   = "service-123456789012@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"

  params = {
    destination_table_name_template = "test_table"
    file_format                     = "CSV"
    data_path                       = "s3://test-bucket/tmp/"

    aws_access_key_id     = "EXAMPLEKEY"
    aws_secret_access_key = "hardcoded-secret" 
  }
}