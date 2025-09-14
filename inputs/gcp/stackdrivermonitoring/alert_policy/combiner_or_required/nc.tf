resource "google_monitoring_alert_policy" "nc" {
  display_name = "AND Combiner Alert - Non-Compliant"
  project      = var.project
  combiner     = "AND"
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
   
}