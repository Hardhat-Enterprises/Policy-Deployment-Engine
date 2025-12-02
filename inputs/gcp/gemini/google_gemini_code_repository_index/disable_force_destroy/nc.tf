resource "google_gemini_code_repository_index" "nc1" {
  project = "PDE"
  code_repository_index_id = "nc1"
  location = "asia-south1"
  kms_key = "random"
  force_destroy = true
}