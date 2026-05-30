resource "google_data_pipeline_pipeline" "c" {
  name    = "c"
  project = "google_data_pipeline_pipeline.pipeline.project"
  type    = "PIPELINE_TYPE_BATCH"
  state   = "STATE_ACTIVE"

  workload {
    dataflow_flex_template_request {
      project_id = "my-project"
      location   = "aus-central1"

      launch_parameter {
        job_name = "specified_job"

        environment {
          ip_configuration = "WORKER_IP_PRIVATE"
        }
      }
    }
  }
}