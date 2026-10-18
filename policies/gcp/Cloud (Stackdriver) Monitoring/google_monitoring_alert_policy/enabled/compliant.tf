resource "google_monitoring_alert_policy" "compliant_example_1" {
  project      = "ecstatic-device-491708-g4"
  display_name = "compliant_example_1"
  enabled      = true
  combiner     = "OR"

  conditions {
    display_name = "c"
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
