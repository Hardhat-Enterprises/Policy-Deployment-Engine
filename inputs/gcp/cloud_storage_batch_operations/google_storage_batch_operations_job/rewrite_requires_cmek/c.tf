# Cloud Storage Batch Operations — compliant (rewrite_requires_cmek — valid CMEK key provided)

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

  rewrite_object {
    kms_key = "projects/example/locations/us-central1/keyRings/kr/cryptoKeys/key"
  }
}