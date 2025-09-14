# Cloud Storage Batch Operations — non-compliant (rewrite_requires_cmek — missing/empty CMEK key)

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

  rewrite_object {
    kms_key = ""
  }
}