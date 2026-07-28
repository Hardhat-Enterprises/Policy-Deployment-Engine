resource "google_gemini_logging_setting" "non_compliant_example_1"{
  logging_setting_id = "non_compliant_example_1"
  project = "PDE"
  location = "asia-south1"
  log_metadata = false
}
