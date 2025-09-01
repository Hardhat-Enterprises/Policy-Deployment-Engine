variable "project_id" {
  type        = string
  default     = "civil-lightning-468910-m1"
}

variable "aws_access_key_id" {
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  type        = string
  sensitive   = true
}

resource "google_bigquery_data_transfer_config" "C_transfer" {
  project                = "my_project_id"
  display_name           = "Secure S3 Transfer"
  data_source_id         = "amazon_s3"
  destination_dataset_id = "secure_dataset"
  schedule               = "every 24 hours"

  params = {
    destination_table_name_template = "secure_table"
    file_format                     = "CSV"
    data_path                       = "s3://my-bucket/secure/"
    aws_access_key_id               = var.aws_access_key_id
    aws_secret_access_key           = var.aws_secret_access_key
  }
}