resource "google_dialogflow_generator" "non_compliant_example_1" {
  location = "us_east1"
  project = "my_gcp_project"
  description = "A v4.0 summarization generator."
  inference_parameter {
    max_output_tokens = 1024
    temperature       = 0
    top_k             = 40
    top_p             = 0.95
  }
  summarization_context {
    version = "4.0"
    output_language_code = "en"
  }
  trigger_event = "MANUAL_CALL"
  }