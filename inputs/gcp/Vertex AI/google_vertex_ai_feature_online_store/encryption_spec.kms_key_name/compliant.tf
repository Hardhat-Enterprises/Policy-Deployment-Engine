resource "google_vertex_ai_feature_online_store" "compliant_example_1" {
  name   = "compliant_example_1"
  region = "australia-southeast1"

  optimized {}

  encryption_spec {
    kms_key_name = "projects/example-project/locations/australia-southeast1/keyRings/example-ring/cryptoKeys/example-key"
  }
}