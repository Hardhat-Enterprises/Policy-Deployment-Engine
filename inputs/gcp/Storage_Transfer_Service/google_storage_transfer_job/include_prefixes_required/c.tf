resource "google_storage_transfer_job" "c" {
  description = "compliant-transfer-job"
  status      = "ENABLED"

  transfer_spec {
    gcs_data_source {
      bucket_name = "source-bucket-example"
    }

    gcs_data_sink {
      bucket_name = "destination-bucket-example"
    }

    object_conditions {
      include_prefixes = ["secure-data/"]
    }
  }

  schedule {
    schedule_start_date {
      year  = 2026
      month = 5
      day   = 13
    }
    start_time_of_day {
      hours   = 1
      minutes = 0
      seconds = 0
      nanos   = 0
    }
  }
}