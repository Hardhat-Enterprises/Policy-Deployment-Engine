resource "google_storage_transfer_job" "nc" {
  description = "Non-compliant transfer job"
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
      delete_objects_from_source_after_transfer = true
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