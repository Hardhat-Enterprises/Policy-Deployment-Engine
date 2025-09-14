resource "google_gemini_logging_setting" "nc1" {
    project = "PDE"
    logging_setting_id = "nc1"
    location = "australia-southeast1"
    log_prompts_and_responses = false
    log_metadata = false
}