resource "google_service_account" "bad_service_account" {
  account_id   = "bad-account"
  display_name = "Bad Service Account"
}

resource "google_data_pipeline_pipeline" "nc" {
  name         = "projects/my-project/locations/europe-west1/pipelines/BadPipeline" # ❌ invalid casing + wrong location
  display_name = "Bad Pipeline Name!" # ❌ invalid chars
  type         = "PIPELINE_TYPE_STREAMING"
  state        = "STATE_UNSPECIFIED"   # ❌ invalid state
  region       = "europe-west1"        # ❌ not allowed

  workload {
    dataflow_launch_template_request {
      project_id = "my-project"
      gcs_path   = "invalid-path" # ❌ not a gs:// path
      launch_parameters {
        job_name = "BadJobName!"
        environment {
          num_workers           = 0     # ❌ invalid
          max_workers           = 2000  # ❌ exceeds limit
          zone                  = "unknown-zone"
          service_account_email = google_service_account.bad_service_account.email
          temp_location         = "/tmp" # ❌ invalid path
        }
      }
    }
  }

  schedule_info {
    schedule = "invalid-cron" # ❌ invalid cron
  }
}
