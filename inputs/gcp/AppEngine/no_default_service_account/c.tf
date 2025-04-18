resource "google_app_engine_standard_app_version" "c"{
  service      = "my-service"
  version_id  = "v1"
  runtime     = "python3.9"
  service_account = "my-service-account"
  deployment {
  zip {
    source_url = "https://storage.googleapis.com/my-bucket/app.zip"
  }
}

  entrypoint {shell = "gunicorn -b :$PORT main:app" }
}