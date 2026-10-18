resource "google_app_engine_standard_app_version" "compliant_example_1" {
  project    = "gcp-project-12345"
  version_id = "v1"
  service    = "default"
  runtime    = "nodejs20"

  entrypoint {
    shell = "node ./app.js"
  }

  deployment {
    files {
      name       = "app.js"
      source_url = "https://storage.googleapis.com/appengine-static-content/app.js"
      sha1_sum   = "0123456789abcdef0123456789abcdef01234567"
    }
  }
}