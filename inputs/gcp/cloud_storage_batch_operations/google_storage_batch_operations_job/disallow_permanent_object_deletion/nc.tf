# Cloud Storage Batch Operations — non-compliant (disallow_permanent_object_deletion — permanent deletion enabled)

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

  delete_object {
    permanent_object_deletion_enabled = true
  }
}