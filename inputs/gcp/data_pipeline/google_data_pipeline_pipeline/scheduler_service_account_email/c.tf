resource "google_data_pipeline_pipeline" "c" {
  name                            = "c"
  project                         = "google_data_pipeline_pipeline.pipeline.project"
  type                            = "PIPELINE_TYPE_BATCH"
  state                           = "STATE_ACTIVE"
  scheduler_service_account_email = "Employee@companyname.com"
}
