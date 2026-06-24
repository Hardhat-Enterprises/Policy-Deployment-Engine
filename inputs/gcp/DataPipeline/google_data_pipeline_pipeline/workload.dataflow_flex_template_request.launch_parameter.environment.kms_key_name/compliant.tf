resource "google_data_pipeline_pipeline" "compliant_example_1" {
  name    = "compliant_example_1"
  project = "google_data_pipeline_pipeline.pipeline.project"
  type    = "PIPELINE_TYPE_BATCH"
  state   = "STATE_ACTIVE"

  workload {
    dataflow_flex_template_request {
      project_id = "my-project"
      location   = "aus-central1"

      launch_parameter {
        job_name = "example-job"

        environment {
          kms_key_name = "projects/security-project/locations/us-central1/keyRings/pipeline-keys/cryptoKeys/pipeline-key"
        }
      }
    }
  }
}
