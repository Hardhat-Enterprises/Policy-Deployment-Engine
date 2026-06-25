resource "google_storage_batch_operations_job" "compliant_example_1" {
  project  = "test-project"
  job_id   = "c1"
  description = "compliant_example_1"
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
