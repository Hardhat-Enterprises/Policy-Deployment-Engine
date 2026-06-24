resource "google_gemini_gemini_gcp_enablement_setting" "non_compliant_example_1"{
  gemini_gcp_enablement_setting_id = "non_compliant_example_1"
  project = "PDE"
  location = "asia-south1"
  web_grounding_type = "GROUNDING_WITH_GOOGLE_SEARCH"
}
