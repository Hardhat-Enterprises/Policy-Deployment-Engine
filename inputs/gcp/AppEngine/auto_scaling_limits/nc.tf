resource "google_app_engine_standard_app_version" "nc" {
  service     = "default"
  version_id  = "v1"
  runtime     = "nodejs18"

  entrypoint {
    shell = "node app.js"
  }

  automatic_scaling {
    standard_scheduler_settings {
      max_instances = 200 # Exceeds compliant range
    }
  }

  deployment {
    zip {
      source_url = "https://example.com/source.zip"
    }
  }
}
