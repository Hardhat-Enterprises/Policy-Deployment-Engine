resource "google_gemini_data_sharing_with_google_setting" "non_compliant_example_1"{
  data_sharing_with_google_setting_id = "non_compliant_example_1"
  project = "PDE"
  location = "asia-south1"
  enable_data_sharing = true
}
