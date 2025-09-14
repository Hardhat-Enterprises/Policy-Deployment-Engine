# Cloud Storage Batch Operations — non-compliant (require_scope_prefix_or_manifest — unscoped job)

resource "google_storage_batch_operations_job" "nc" {
  provider = google-beta
  project  = "test-project"
  job_id   = "nc-job"

  bucket_list {
    buckets {
      bucket = "my-bucket"
      prefix_list {
        included_object_prefixes = [""]
      }
    }
  }

  delete_object {
    permanent_object_deletion_enabled = false
  }
}