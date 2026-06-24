resource "google_data_pipeline_pipeline" "c1" {
  name    = "c1"
  project = "google_data_pipeline_pipeline.pipeline.project"
  type    = "PIPELINE_TYPE_BATCH"
  state   = "STATE_ACTIVE"
  region  = "australia-southeast1"
}
resource "google_data_pipeline_pipeline" "c2" {
  name    = "c2"
  project = "google_data_pipeline_pipeline.pipeline.project"
  type    = "PIPELINE_TYPE_BATCH"
  state   = "STATE_ACTIVE"
  region  = "australia-southeast2"
}
