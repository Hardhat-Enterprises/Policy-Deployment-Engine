resource "google_model_armor_floorsetting" "nc" {
  parent   = "nc"
  location = "us-east1"

  filter_config {
    rai_settings {
      rai_filters {
        filter_type      = "INVALID_TYPE"   
        confidence_level = "LOW_ONLY"       
      }
    }
  }
}
