resource "google_model_armor_template" "c" {
   template_id = "c"
   project = "c project"
  location    = "global"

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
}