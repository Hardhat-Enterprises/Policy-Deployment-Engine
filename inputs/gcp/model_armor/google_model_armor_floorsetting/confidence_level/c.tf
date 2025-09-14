resource "google_model_armor_floorsetting" "c" {
  parent      = "c"
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