resource "google_app_engine_standard_app_version" "non_compliant_example_1" {
  project    = "gcp-project-12345"
  version_id = "v1"
  service    = "default"
  runtime    = "nodejs20"

  entrypoint {
    shell = "node ./app.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/appengine-static-content/hello-world.zip"
    }
  }

  vpc_access_connector {
    name           = "projects/gcp-project-12345/locations/us-central1/connectors/app-engine-connector"
    egress_setting = "PRIVATE_RANGES_ONLY"
  }
}