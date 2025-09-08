resource "google_service_account" "service_account" {
  account_id   = "pipeline-account"
  display_name = "Pipeline Service Account"
}

resource "google_data_pipeline_pipeline" "c" {
  name         = "projects/my-project/locations/us-central1/pipelines/compliant-pipeline"
  display_name = "compliant_pipeline"
  type         = "PIPELINE_TYPE_BATCH"
  state        = "STATE_ACTIVE"
  region       = "us-central1"

  workload {
    dataflow_launch_template_request {
      project_id = "my-project"
      gcs_path   = "gs://my-bucket/template"
      launch_parameters {
        job_name = "compliant-job"
        parameters = {
          "name" : "valid"
        }
        environment {
          num_workers           = 3
          max_workers           = 5
          zone                  = "us-central1-a"
          service_account_email = google_service_account.service_account.email
          temp_location         = "gs://my-bucket/tmp"
          machine_type          = "E2"
          worker_region         = "us-central1"
          worker_zone           = "us-central1-a"
          enable_streaming_engine = "false"
        }
      }
      location = "us-central1"
    }
  }

  schedule_info {
    schedule = "0 * * * *" # every hour
  }
}
