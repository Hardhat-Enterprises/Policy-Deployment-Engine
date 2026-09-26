resource "google_gemini_release_channel_setting" "non_compliant_example_1"{
  release_channel_setting_id = "non_compliant_example_1"
  project = "PDE"
  location = "australia-southeast2"
  release_channel = "EXPERIMENTAL"
}
