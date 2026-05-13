resource "google_storage_transfer_job" "nc" {
  description = "Non-compliant AWS S3 transfer job"
  project = "my-project-123"
  status = "ENABLED"

  transfer_spec {
    aws_s3_data_source {
      bucket_name = "my-source-bucket"

      aws_access_key {
        access_key_id = "AKIAIOSFODNN7EXAMPLE"
        secret_access_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
      }
    }

    gcs_data_sink {
      bucket_name = "my-transfer-bucket"
    }
  }

  schedule {
    schedule_start_date {
      year = 2026
      month = 1
      day = 1
    }
  }
}