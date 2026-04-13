resource "google_gemini_gemini_gcp_enablement_setting" "c" {
  gemini_gcp_enablement_setting_id = "c"
  project                          = "PDE"
  location                         = "australia-southeast2"
  enable_customer_data_sharing     = false
}