resource "google_eventarc_pipeline" "non_compliant_example_1" {
  pipeline_id = "non-compliant-example-1"
  location    = "asia-east1"
  project     = "pde-project"

  destinations {
    http_endpoint {
      uri = "https://svc.us-central1.p.local:8080/route"
    }
  }
}
