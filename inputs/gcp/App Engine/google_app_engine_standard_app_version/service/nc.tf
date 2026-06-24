resource "google_app_engine_standard_app_version" "nc" {
  project = "gcp-project-12345"
  version_id = "v1"
  service    = "unauthorized-app-name"
  runtime    = "nodejs10"

  entrypoint {
    shell = "node ./app.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.bucket.name}/${google_storage_bucket_object.object.name}"
    }
  }

  service_account = "google_service_account.custom_service_account.email"
}