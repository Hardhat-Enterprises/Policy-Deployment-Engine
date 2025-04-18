resource "google_app_engine_standard_app_version" "c" {
  service  = "default"
  version_id = "v1"
  runtime  = "python39"

  entrypoint {
    shell = "python main.py"
  }

  automatic_scaling {
  //  max_total_instances = 10
  }

  deployment {
    zip {
      source_url = "https://example.com/source.zip"
    }
  }
}
