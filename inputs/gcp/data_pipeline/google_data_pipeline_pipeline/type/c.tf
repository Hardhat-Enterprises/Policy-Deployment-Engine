resource "google_data_pipeline_pipeline" "c" {
  name    = "c"
  project = "google_data_pipeline_pipeline.pipeline.project"
  type    = "PIPELINE_TYPE_STREAMING"
  state   = "STATE_ACTIVE"
}
