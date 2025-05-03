# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_service_account" "cloudrun_sa" {
  account_id   = "cloud-run-sa"
  display_name = "cloud_run_secure SA"
}

resource "google_cloud_run_v2_job" "c" {
  name = "cloud_run_job-c"
  location = "AU"

  template {
    template {
      service_account = google_service_account.cloudrun_sa.email

      containers {
        image = "gcr.io/example/image"
      }
    }
  }
}

