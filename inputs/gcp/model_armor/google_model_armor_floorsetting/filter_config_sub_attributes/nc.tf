resource "google_model_armor_floorsetting" "nc" {
  location    = "global"
  parent      = "nc"

  filter_config {

    sdp_settings {
      basic_config {
          filter_enforcement = "DISABLED"
      }
    }
    pi_and_jailbreak_filter_settings {
      filter_enforcement = "DISABLED"
      confidence_level   = "HIGH"
    }
    malicious_uri_filter_settings {
      filter_enforcement = "DISABLED"
    }
  }

  enable_floor_setting_enforcement = false
}