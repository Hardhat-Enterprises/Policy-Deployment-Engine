# Vertex AI Reasoning Engine that uses a static service account instead of
# managed Agent Identity.

resource "google_vertex_ai_reasoning_engine" "non_compliant_example_1" {
  display_name = "non_compliant_example_1"
  region       = "australia-southeast1"

  spec {
    identity_type = "SERVICE_ACCOUNT"
  }
}