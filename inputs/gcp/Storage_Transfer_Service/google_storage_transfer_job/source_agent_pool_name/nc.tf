resource "google_storage_transfer_job" "nc" {
  name        = "nc"
  description = "nc"
  project     = "my-project-123"
  status      = "ENABLED"

  transfer_spec {
    source_agent_pool_name = "projects/my-project-123/agentPools/unapproved-pool"

    gcs_data_source {
      bucket_name = "source-bucket-nc"
    }

    gcs_data_sink {
      bucket_name = "destination-bucket-nc"
    }
  }
}