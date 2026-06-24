resource "google_storage_batch_operations_job" "compliant_example_1" {
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
  rewrite_object {
    kms_key = "projects/test-project/locations/us-central1/keyRings/test-keyring/cryptoKeys/test-key"
  }
}
