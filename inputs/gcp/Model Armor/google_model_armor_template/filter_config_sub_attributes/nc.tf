resource "google_model_armor_template" "nc" {
   template_id = "nc"
   project = "nc project"
   location    = "global"

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
}
