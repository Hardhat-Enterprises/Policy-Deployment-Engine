resource "google_gemini_logging_setting" "nc"{
  logging_setting_id = "nc"
  project = "PDE"
  location = "asia-south1"
  log_metadata = false
}
