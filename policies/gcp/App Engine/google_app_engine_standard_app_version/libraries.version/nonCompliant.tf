resource "google_app_engine_standard_app_version" "non_compliant_example_1" {
  project    = "gcp-project-12345"
  version_id = "v1"
  service    = "default"
  runtime    = "python27"

  entrypoint {
    shell = "python main.py"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/appengine-static-content/hello-world.zip"
    }
  }

  libraries {
    name    = "django"
    version = "latest"
  }
}