resource "google_vertex_ai_endpoint" "compliant_example_1" {
  name         = "endpoint-name"
  display_name = "sample-endpoint"
  location     = "us-central1"

  encryption_spec {
    kms_key_name = "projects/my-project/locations/us-central1/keyRings/my-kr/cryptoKeys/my-key"
  }
}