resource "google_dialogflow_cx_agent" "non_compliant_example_1" {
  display_name          = "non-compliant-example-1"
  location              = "australia-southeast1"
  default_language_code = "en"
  time_zone             = "Australia/Sydney"

  advanced_settings {
    logging_settings {
      enable_consent_based_redaction = false
    }
  }
}
