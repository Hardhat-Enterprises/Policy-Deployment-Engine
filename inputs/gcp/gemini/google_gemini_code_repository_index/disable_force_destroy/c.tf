resource "google_gemini_code_repository_index" "c1" {
  project                  = "PDE"
  code_repository_index_id = "c1"
  location                 = "australia-southeast2"
  kms_key                  = "projects/projectExample/locations/locationExample/keyRings/keyRingExample/cryptoKeys/cryptoKeyExample"
  force_destroy            = false
}