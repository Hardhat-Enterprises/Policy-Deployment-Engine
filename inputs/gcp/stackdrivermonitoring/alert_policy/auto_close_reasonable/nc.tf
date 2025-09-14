resource "google_monitoring_alert_policy" "nc" {
  display_name = "Unreasonable Auto Close - Non-Compliant"
  project      = var.project
  combiner     = "OR"
  enabled      = true
  
  conditions {
    display_name = "Security threshold"
    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/firewall/dropped_packets_count\" AND resource.type=\"gce_instance\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = 10
      
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }
  
   documentation {
    content = "Security monitoring alert policy"
    mime_type = "text/markdown"
  }
  
  
  alert_strategy {
    auto_close = "2592000s"
  }
}