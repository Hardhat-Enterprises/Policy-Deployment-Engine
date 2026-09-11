resource "google_dialogflow_cx_agent" "non_compliant_example_1" {
  display_name          = "non_compliant_example_1"
  location              = "us-central1"
  default_language_code = "en"
  time_zone             = "Australia/Sydney"
}

resource "google_dialogflow_cx_agent" "non_compliant_example_2" {
  display_name          = "non_compliant_example_2"
  location              = "australia-southeast2"
  default_language_code = "en"
  time_zone             = "Australia/Sydney"
}
