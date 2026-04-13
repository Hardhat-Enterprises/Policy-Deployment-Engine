resource "google_app_engine_standard_app_version" "nc" {
  version_id = "v1"
  project = "gcp-project-12345"
  service    = "default"
  runtime    = "nodejs20"

  entrypoint {
    shell = "bash ./app.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/appengine-static-content/hello-world.zip"
    }
  }
}