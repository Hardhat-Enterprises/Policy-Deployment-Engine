resource "google_vertex_ai_reasoning_engine" "compliant_example_1" {
  display_name = "compliant_example_1"
  region       = "australia-southeast1"

  encryption_spec {
    kms_key_name = "projects/example-project/locations/australia-southeast1/keyRings/example-ring/cryptoKeys/example-key"
  }
}
