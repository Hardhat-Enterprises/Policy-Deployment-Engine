resource "google_model_armor_floorsetting" "compliant_example_1" {
  parent      = "compliant_example_1"
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
