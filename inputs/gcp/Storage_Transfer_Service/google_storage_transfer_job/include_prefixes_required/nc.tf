resource "google_storage_transfer_job" "nc" {
  description = "noncompliant-transfer-job"
  status      = "ENABLED"

  transfer_spec {
    gcs_data_source {
      bucket_name = "source-bucket-example"
    }

    gcs_data_sink {
      bucket_name = "destination-bucket-example"
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