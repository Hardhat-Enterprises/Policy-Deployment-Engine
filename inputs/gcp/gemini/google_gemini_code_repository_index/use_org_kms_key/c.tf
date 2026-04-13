resource "google_gemini_code_repository_index" "c" {
  code_repository_index_id = "c"
  project                  = "PDE"
  location                 = "australia-southeast2"
  kms_key                  = "projects/projectExample/locations/locationExample/keyRings/keyRingExample/cryptoKeys/cryptoKeyExample"
  force_destroy            = false
}