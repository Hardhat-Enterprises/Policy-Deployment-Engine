resource "google_monitoring_alert_policy" "nc" {
  display_name = "Inappropriate Alignment - Non-Compliant"
  project      = var.project
  combiner     = "OR"
  enabled      = true
  
  conditions {
    display_name = "Slow alignment monitoring"
    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/firewall/dropped_packets_count\" AND resource.type=\"gce_instance\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = 10
      
      aggregations {
        alignment_period   = "1800s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }
  
   documentation {
    content = "Security monitoring alert policy"
    mime_type = "text/markdown"
  }
  
}