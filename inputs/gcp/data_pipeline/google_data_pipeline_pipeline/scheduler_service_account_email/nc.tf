resource "google_data_pipeline_pipeline" "nc" {
  name                            = "nc"
  project                         = "google_data_pipeline_pipeline.pipeline.project"
  type                            = "PIPELINE_TYPE_BATCH"
  state                           = "STATE_ACTIVE"
  scheduler_service_account_email = "un_identified@customdomain.com"
}
