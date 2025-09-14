resource "google_monitoring_alert_policy" "c" {
  display_name = "Specific Filter Alert - Compliant"
  project      = var.project
  combiner     = "OR"
  enabled      = true
  
  conditions {
    display_name = "Specific resource monitoring"
    condition_threshold {
      filter          = "resource.type=\"gce_instance\" AND metric.type=\"compute.googleapis.com/instance/cpu/utilization\""
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

variable "project" {
  type = string
}