resource "google_data_pipeline_pipeline" "compliant_example_1" {
  name    = "compliant_example_1"
  project = "google_data_pipeline_pipeline.pipeline.project"
  type    = "PIPELINE_TYPE_BATCH"
  state   = "STATE_ACTIVE"
  region  = "australia-southeast1"

  workload {
    dataflow_flex_template_request {
      project_id = "google_data_pipeline_pipeline.pipeline.project"
      location   = "australia-southeast1"

      launch_parameter {
        job_name = "compliant-job"

        environment {
          worker_zone = "australia-southeast1-a"
        }
      }
    }
  }
}
