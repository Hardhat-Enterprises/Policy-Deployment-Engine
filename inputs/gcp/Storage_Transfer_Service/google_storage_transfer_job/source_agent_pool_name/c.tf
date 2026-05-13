resource "google_storage_transfer_job" "c" {
  name        = "c"
  description = "c"
  project     = "my-project-123"
  status      = "ENABLED"

  transfer_spec {
    source_agent_pool_name = "projects/my-project-123/agentPools/approved-pool"

    gcs_data_source {
      bucket_name = "source-bucket-c"
    }

    gcs_data_sink {
      bucket_name = "destination-bucket-c"
    }
  }
}