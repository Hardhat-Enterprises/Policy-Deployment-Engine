resource "google_app_engine_standard_app_version" "nc" {
  service  = "default"
  version_id = "v1"
  runtime  = "php5.5" # Non-compliant runtime

  entrypoint {
    shell = "php index.php"
  }

  automatic_scaling {
    # max_total_instances = 10
  }

  deployment {
    zip {
      source_url = "https://example.com/source.zip"
    }
  }
}
