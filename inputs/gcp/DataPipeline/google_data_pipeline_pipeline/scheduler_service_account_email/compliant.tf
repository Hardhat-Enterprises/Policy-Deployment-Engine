resource "google_data_pipeline_pipeline" "compliant_example_1" {
  name                            = "compliant_example_1"
  project                         = "google_data_pipeline_pipeline.pipeline.project"
  type                            = "PIPELINE_TYPE_BATCH"
  state                           = "STATE_ACTIVE"
  scheduler_service_account_email = "Employee@companyname.com"
}
