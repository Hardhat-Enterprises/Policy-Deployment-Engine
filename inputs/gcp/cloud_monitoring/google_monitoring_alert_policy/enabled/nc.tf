resource "google_monitoring_alert_policy" "nc" {
  project      = "ecstatic-device-491708-g4"
  display_name = "nc"
  enabled      = false
  combiner     = "OR"

  conditions {
    display_name = "nc"
    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 1000
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }
}
