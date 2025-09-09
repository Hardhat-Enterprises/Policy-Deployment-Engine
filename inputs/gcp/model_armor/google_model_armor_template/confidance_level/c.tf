resource "google_model_armor_template" "c" {
  template_id = "c"
  project = "C project"
  location    = "global"

   filter_config {
     rai_settings {
         rai_filters {
        filter_type      = "DANGEROUS"
        confidence_level = "LOW_AND_ABOVE"
      }
     }
  }
  
}