resource "google_vertex_ai_reasoning_engine" "non_compliant_example_1" {
  display_name = "non_compliant_example_1"
  region       = "australia-southeast1"

  encryption_spec {
    kms_key_name = "invalid-kms-key"
  }
}
