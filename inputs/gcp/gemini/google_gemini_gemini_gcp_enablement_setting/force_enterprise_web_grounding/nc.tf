resource "google_gemini_gemini_gcp_enablement_setting" "nc" {
  gemini_gcp_enablement_setting_id = "nc"
  project                          = "PDE"
  location                         = "asia-south1"
  web_grounding_type               = "GROUNDING_WITH_GOOGLE_SEARCH"
}
