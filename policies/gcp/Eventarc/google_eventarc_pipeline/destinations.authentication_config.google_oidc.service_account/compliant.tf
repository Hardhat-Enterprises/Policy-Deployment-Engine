resource "google_eventarc_pipeline" "compliant_example_1" {
  pipeline_id = "compliant-example-1"
  location    = "us-central1"
  project     = "pde-project"

  destinations {
    http_endpoint {
      uri = "https://svc.us-central1.p.local:8080/route"
    }
    authentication_config {
      google_oidc {
        service_account = "eventarc-invoker@pde-project.iam.gserviceaccount.com"
      }
    }
  }
}
