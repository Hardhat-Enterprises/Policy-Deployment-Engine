resource "google_app_engine_standard_app_version" "compliant_example_1" {
  project        = "gcp-project-12345"
  version_id     = "v1"
  service        = "prod-web"
  runtime        = "nodejs20"
  instance_class = "F1"

  entrypoint { shell = "node ./app.js" }

  deployment {
    zip { source_url = "https://storage.googleapis.com/appengine-static-content/hello-world.zip" }
  }
}
