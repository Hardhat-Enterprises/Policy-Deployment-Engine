resource "google_model_armor_floorsetting" "nc" {
  parent      = "nc"
  location    = "global"

  filter_config {}
}