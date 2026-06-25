resource "google_model_armor_floorsetting" "non_compliant_example_1" {
  parent   = "non_compliant_example_1"
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
