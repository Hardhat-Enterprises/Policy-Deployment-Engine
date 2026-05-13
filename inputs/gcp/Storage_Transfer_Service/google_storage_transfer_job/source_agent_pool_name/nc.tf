resource "google_storage_transfer_job" "nc" {
  description = "Non-compliant transfer job"
  project = "my-project-123"
  status = "ENABLED"

  transfer_spec {
    source_agent_pool_name = "projects/my-project-123/agentPools/unapproved-pool"

    posix_data_source {
      root_directory = "/source"
    }

    gcs_data_sink {
      bucket_name = "my-transfer-bucket"
      path = "incoming/"
    }
  }

  schedule {
    schedule_start_date {
      year = 2026
      month = 1
      day = 1
    }

    start_time_of_day {
      hours = 1
      minutes = 0
      seconds = 0
      nanos = 0
    }
  }
}