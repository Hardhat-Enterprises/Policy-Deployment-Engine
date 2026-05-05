resource "google_data_pipeline_pipeline" "nc1" {
  name    = "nc1"
  project = "google_data_pipeline_pipeline.pipeline.project"
  type    = "PIPELINE_TYPE_BATCH"
  state   = "STATE_STOPPING"
}
resource "google_data_pipeline_pipeline" "nc2" {
  name    = "nc2"
  project = "google_data_pipeline_pipeline.pipeline.project"
  type    = "PIPELINE_TYPE_BATCH"
  state   = "STATE_RESUMING"
}
resource "google_data_pipeline_pipeline" "nc3" {
  name    = "nc3"
  project = "google_data_pipeline_pipeline.pipeline.project"
  type    = "PIPELINE_TYPE_BATCH"
  state   = "STATE_ARCHIVED"
}
resource "google_data_pipeline_pipeline" "nc4" {
  name    = "nc4"
  project = "google_data_pipeline_pipeline.pipeline.project"
  type    = "PIPELINE_TYPE_BATCH"
  state   = "STATE_UNSPECIFIED"
}
