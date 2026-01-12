resource "google_gemini_gemini_gcp_enablement_setting" "nc"{
  gemini_gcp_enablement_setting_id = "nc"
  project = "PDE"
  location = "asia-south1"
  enable_customer_data_sharing = true
}
