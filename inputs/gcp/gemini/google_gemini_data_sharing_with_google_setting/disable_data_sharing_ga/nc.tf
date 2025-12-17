resource "google_gemini_data_sharing_with_google_setting" "nc"{
  data_sharing_with_google_setting_id = "nc"
  project = "PDE"
  location = "asia-south1"
  enable_data_sharing = false
}
