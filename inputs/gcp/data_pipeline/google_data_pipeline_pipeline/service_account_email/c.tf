resource "google_data_pipeline_pipeline" "c" {
  name    = "c"
  project = "google_data_pipeline_pipeline.pipeline.project"
  type    = "PIPELINE_TYPE_BATCH"
  state   = "STATE_ACTIVE"

  workload {
    dataflow_flex_template_request {
      project_id = "google_data_pipeline_pipeline.pipeline.project"
      location   = "australia-southeast1"

      launch_parameter {
        job_name = "compliant-job"

        environment {
          service_account_email = "pipeline_sa@orginisationemail.com"
        }
      }
    }
  }
}