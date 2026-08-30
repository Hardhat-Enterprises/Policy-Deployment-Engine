resource "google_vertex_ai_index" "compliant_example_1" {
  display_name = "compliant-index"
  region       = "us-central1"
  
  encryption_spec {
    kms_key_name = "projects/my-project/locations/us-central1/keyRings/my-kr/cryptoKeys/my-key"
  }
}