resource "google_model_armor_template" "nc" {
  template_id = "nc"
  project = "nc project"
  location    = "global"

  filter_config {
    
  }
}