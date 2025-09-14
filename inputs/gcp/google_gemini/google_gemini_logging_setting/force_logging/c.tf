resource "google_gemini_logging_setting" "c1" {
    project = "PDE"
    logging_setting_id = "c1"
    location = "australia-southeast1"
    log_prompts_and_responses = true
    log_metadata = true
}
