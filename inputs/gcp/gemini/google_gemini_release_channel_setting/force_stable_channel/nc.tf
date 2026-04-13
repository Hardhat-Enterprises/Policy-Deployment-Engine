resource "google_gemini_release_channel_setting" "nc" {
  release_channel_setting_id = "nc"
  project                    = "PDE"
  location                   = "asia_south1"
  release_channel            = "EXPERIMENTAL"
}
