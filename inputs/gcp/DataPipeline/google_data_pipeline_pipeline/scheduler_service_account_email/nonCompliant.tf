resource "google_data_pipeline_pipeline" "non_compliant_example_1" {
  name                            = "non_compliant_example_1"
  project                         = "google_data_pipeline_pipeline.pipeline.project"
  type                            = "PIPELINE_TYPE_BATCH"
  state                           = "STATE_ACTIVE"
  scheduler_service_account_email = "un_identified@customdomain.com"
}
