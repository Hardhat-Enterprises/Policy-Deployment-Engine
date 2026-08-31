resource "google_dialogflow_cx_agent" "non_compliant_example_1" {
  display_name          = "dialogflow-cx-agent-fixture"
  location              = "australia-southeast1"
  default_language_code = "en"
  time_zone             = "Australia/Sydney"

  advanced_settings {
    logging_settings {
      enable_stackdriver_logging = false
    }
  }
}
