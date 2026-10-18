resource "google_eventarc_pipeline" "non_compliant_example_1" {
  pipeline_id = "non-compliant-example-1"
  location    = "us-central1"
  project     = "pde-project"

  destinations {
    http_endpoint {
      uri = "https://svc.us-central1.p.local:8080/route"
    }
  }

  logging_config {
    log_severity = "NONE"
  }
}

resource "google_eventarc_pipeline" "non_compliant_example_2" {
  pipeline_id = "non-compliant-example-2"
  location    = "us-central1"
  project     = "pde-project"

  destinations {
    http_endpoint {
      uri = "https://svc.us-central1.p.local:8080/route"
    }
  }

  # logging_config left unset entirely: defaults to NONE (first enum value).
}
