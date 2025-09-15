resource "google_model_armor_floorsetting" "c" {
  location    = "global"
  parent      = "c"

  filter_config {

    sdp_settings {
      basic_config {
          filter_enforcement = "ENABLED"
      }
    }
    pi_and_jailbreak_filter_settings {
      filter_enforcement = "ENABLED"
      confidence_level   = "HIGH"
    }
    malicious_uri_filter_settings {
      filter_enforcement = "ENABLED"
    }
  }

  enable_floor_setting_enforcement = true
}