resource "google_gemini_logging_setting" "compliant_example_1"{
  logging_setting_id = "compliant_example_1"
  project = "PDE"
  location = "australia-southeast2"
  log_prompts_and_responses = true
}
