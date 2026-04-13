resource "google_gemini_code_repository_index" "nc" {
  code_repository_index_id = "nc"
  project                  = "PDE"
  location                 = "asia-south1"
  kms_key                  = "random"
  force_destroy            = true
}