resource "google_app_engine_standard_app_version" "nc" {
  service     = "my-service"
  version_id  = "v1"
  runtime     = "python39"
  service_account = "default"
   deployment {
  zip {
    source_url = "https://storage.googleapis.com/my-bucket/app.zip"
  }
}
  entrypoint {
    shell = "gunicorn -b :$PORT main:app"
  }
}