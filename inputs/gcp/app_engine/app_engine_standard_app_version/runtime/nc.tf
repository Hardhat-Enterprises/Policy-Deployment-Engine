resource "google_app_engine_standard_app_version" "nc" {
  project    = "gcp-project-12345"
  version_id = "v1"
  service    = "default"
  runtime    = "nodejs10"

  entrypoint {
    shell = "node ./app.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/appengine-static-content/hello-world.zip"
    }
  }
}