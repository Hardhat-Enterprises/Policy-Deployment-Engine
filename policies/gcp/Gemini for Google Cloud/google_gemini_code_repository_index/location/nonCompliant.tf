resource "google_gemini_code_repository_index" "non_compliant_example_1"{
  code_repository_index_id = "non_compliant_example_1"
  project = "PDE"
  location = "asia-south1"
  kms_key = "projects/projectExample/locations/locationExample/keyRings/keyRingExample/cryptoKeys/cryptoKeyExample"
  force_destroy = false
}
