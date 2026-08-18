# Vertex AI Reasoning Engine with no customer-managed encryption key.
# Falls back to Google-managed encryption, which the policy should flag.

resource "google_vertex_ai_reasoning_engine" "non_compliant_example_1" {
  display_name = "non_compliant_example_1"
  region       = "australia-southeast1"
}