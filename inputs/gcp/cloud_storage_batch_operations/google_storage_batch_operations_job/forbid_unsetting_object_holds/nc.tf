# Cloud Storage Batch Operations — non-compliant (forbid_unsetting_object_holds — holds unset)

resource "google_storage_batch_operations_job" "nc" {
  provider = google-beta
  project  = "test-project"
  job_id   = "nc-job"

  bucket_list {
    buckets {
      bucket = "my-bucket"
      prefix_list {
        included_object_prefixes = ["archive/2025/"]
      }
    }
  }

  put_object_hold {
    event_based_hold = "UNSET"
  }
}