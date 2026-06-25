resource "google_model_armor_template" "compliant_example_1" {
  template_id = "compliant_example_1"
  project = "C project"
  location    = "global"

   filter_config {
     rai_settings {
         rai_filters {
        filter_type      = "DANGEROUS"
        confidence_level = "MEDIUM_AND_ABOVE"
      }
     }
  }
  
}
