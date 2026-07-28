resource "google_model_armor_template" "non_compliant_example_1" {
   template_id = "non_compliant_example_1"
   project = "nc project"
  location    = "global"

  filter_config {
    rai_settings {
      rai_filters {
        filter_type      = "INVALID_TYPE"   
        confidence_level = "LOW_ONLY"       
      }
    }
  }
}
