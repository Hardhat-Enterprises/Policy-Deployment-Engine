# Cloud Storage Batch Operations — compliant (require_scope_prefix_or_manifest — scoped with prefix)

resource "google_storage_batch_operations_job" "c" {
  provider = google-beta
  project  = "test-project"
  job_id   = "c-job"

  bucket_list {
    buckets {
      bucket = "my-bucket"
      prefix_list {
        included_object_prefixes = ["archive/2025/"]
      }
    }
  }

  delete_object {
    permanent_object_deletion_enabled = false
  }
}