# Vertex AI Reasoning Engine that uses managed Agent Identity.
# Only the tested resource type appears here — no dependency resources.
# We run `terraform plan` only, so no real identity is created.

resource "google_vertex_ai_reasoning_engine" "compliant_example_1" {
  display_name = "compliant_example_1"
  region       = "australia-southeast1"

  spec {
    identity_type = "AGENT_IDENTITY"
  }
}