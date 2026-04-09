resource "google_gemini_logging_setting" "c"{
  logging_setting_id = "c"
  project = "PDE"
  location = "australia-southeast2"
  log_prompts_and_responses = true
}