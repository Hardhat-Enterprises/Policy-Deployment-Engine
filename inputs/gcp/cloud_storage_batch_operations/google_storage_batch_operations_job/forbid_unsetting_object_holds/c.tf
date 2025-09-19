resource "google_storage_batch_operations_job" "c" {
  provider = google-beta
  project  = "test-project"
  job_id   = "c1"

  bucket_list {
    buckets {
      bucket = "my-bucket"
      prefix_list {
        included_object_prefixes = ["archive/2025/"]
      }
    }
  }

  put_object_hold {
    event_based_hold = "SET"
    temporary_hold   = "SET"
  }
}
