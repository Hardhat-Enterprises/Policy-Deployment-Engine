resource "google_eventarc_pipeline" "compliant_example_1" {
  pipeline_id     = "compliant-example-1"
  location        = "us-central1"
  project         = "pde-project"
  crypto_key_name = "projects/pde-project/locations/us-central1/keyRings/eventarc-ring/cryptoKeys/eventarc-key"

  destinations {
    http_endpoint {
      uri = "https://svc.us-central1.p.local:8080/route"
    }
  }
}
