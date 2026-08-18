# Vertex AI Reasoning Engine with no service account set.
# It falls back to the default Vertex AI service agent, which has broader
# permissions than the engine needs.

resource "google_vertex_ai_reasoning_engine" "non_compliant_example_1" {
  display_name = "non_compliant_example_1"
  region       = "australia-southeast1"
}