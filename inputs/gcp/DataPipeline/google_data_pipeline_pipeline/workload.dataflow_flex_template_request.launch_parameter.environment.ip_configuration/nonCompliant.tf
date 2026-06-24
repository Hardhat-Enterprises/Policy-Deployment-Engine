resource "google_data_pipeline_pipeline" "non_compliant_example_1" {
  name    = "non_compliant_example_1"
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
          ip_configuration = "WORKER_IP_PUBLIC"
        }
      }
    }
  }
}

resource "google_data_pipeline_pipeline" "non_compliant_example_2" {
  name    = "non_compliant_example_2"
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
          ip_configuration = "WORKER_IP_UNSPECIFIED"
        }
      }
    }
  }
}
