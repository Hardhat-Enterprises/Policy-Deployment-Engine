resource "google_app_engine_standard_app_version" "c" {
  service     = "default"
  version_id  = "v1"
  runtime     = "nodejs18"

  entrypoint {
    shell = "node app.js"
  }

  automatic_scaling {
    standard_scheduler_settings {
      max_instances = 20
    }
  }

  deployment {
    zip {
      source_url = "https://example.com/source.zip"
    }
  }
}
