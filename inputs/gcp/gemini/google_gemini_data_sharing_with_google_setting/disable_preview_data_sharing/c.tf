resource "google_gemini_data_sharing_with_google_setting" "c" {
  data_sharing_with_google_setting_id = "c"
  project                             = "PDE"
  location                            = "australia-southeast2"
  enable_preview_data_sharing         = false
}