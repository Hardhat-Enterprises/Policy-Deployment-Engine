resource "google_data_pipeline_pipeline" "nc" {
  name    = "nc"
  project = "google_data_pipeline_pipeline.pipeline.project"
  type    = "PIPELINE_TYPE_BATCH"
  state   = "STATE_ACTIVE"
  region  = "us-central1"
}

