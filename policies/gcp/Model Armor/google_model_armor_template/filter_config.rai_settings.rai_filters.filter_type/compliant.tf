resource "google_model_armor_template" "compliant_example_1" {
   template_id = "compliant_example_1"
   project = "c project"
  location    = "global"

  filter_config {
     rai_settings {
         rai_filters {
        filter_type      = "DANGEROUS"
        confidence_level = "MEDIUM_AND_ABOVE"
      }
      rai_filters {
        filter_type      = "SEXUAL"
        confidence_level = "MEDIUM_AND_ABOVE"
      }
     }
  }
}
