resource "google_storage_transfer_job" "c" {
  description = "Compliant transfer job"
  project = "my-project-123"
  status = "ENABLED"

  transfer_spec {
    posix_data_source {
      root_directory = "/source"
    }

    gcs_data_sink {
      bucket_name = "my-transfer-bucket"
    }

    transfer_options {
      overwrite_when = "DIFFERENT"
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