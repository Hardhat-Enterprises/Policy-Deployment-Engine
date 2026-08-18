# Vertex AI Reasoning Engine that runs as a named service account.
# Only the tested resource type appears here — no dependency resources.
# We run `terraform plan` only, so the service account is a fake address.

resource "google_vertex_ai_reasoning_engine" "compliant_example_1" {
  display_name = "compliant_example_1"
  region       = "australia-southeast1"

  spec {
    service_account = "example-engine@example-project.iam.gserviceaccount.com"
  }
}