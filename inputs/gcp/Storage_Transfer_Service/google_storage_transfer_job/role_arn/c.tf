resource "google_storage_transfer_job" "c" {
  description = "Compliant AWS S3 transfer job"
  project = "my-project-123"
  status = "ENABLED"

  transfer_spec {
    aws_s3_data_source {
      bucket_name = "my-source-bucket"
      role_arn = "arn:aws:iam::123456789012:role/sts-transfer-role"
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