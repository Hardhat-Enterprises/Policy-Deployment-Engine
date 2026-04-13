resource "google_gemini_release_channel_setting" "c" {
  release_channel_setting_id = "c"
  project                    = "PDE"
  location                   = "australia-southeast2"
  release_channel            = "STABLE"
}