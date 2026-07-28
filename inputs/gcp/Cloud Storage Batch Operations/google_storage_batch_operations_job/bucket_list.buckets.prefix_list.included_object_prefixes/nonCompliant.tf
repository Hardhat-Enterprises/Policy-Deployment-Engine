resource "google_storage_batch_operations_job" "non_compliant_example_1" {
  project  = "test-project"
  job_id   = "nc1"
  description = "non_compliant_example_1"
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
