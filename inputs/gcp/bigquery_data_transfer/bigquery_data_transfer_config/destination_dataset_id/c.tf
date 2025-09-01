variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "civil-lightning-468910-m1"
}

data "google_project" "project" {
  project_id = var.project_id
}

resource "google_bigquery_data_transfer_config" "C" {
  project                = "my_project_id"
  display_name           = "Chhunly Data Transfer"
  data_source_id         = "scheduled_query"
  destination_dataset_id = "bq_customerdata"
  schedule               = "every 24 hours"
  location               = "australia-southeast1"

  params = {
    query                          = "SELECT CURRENT_DATE()"
    destination_table_name_template = "output_table"
    write_disposition              = "WRITE_TRUNCATE"
  }

  service_account_name = "service-${data.google_project.project.number}@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"
}