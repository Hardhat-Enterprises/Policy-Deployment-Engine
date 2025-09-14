resource "google_gemini_data_sharing_with_google_setting" "nc1" {
    project = "PDE"
    data_sharing_with_google_setting_id = "nc1"
    location = "asia-northeast3"
    enable_preview_data_sharing = true
    enable_data_sharing = true
}