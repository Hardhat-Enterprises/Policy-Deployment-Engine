variable "notification_channel_id" {
  description = "Notification channel ID"
  type        = string
}

variable "common_labels" {
  description = "Common labels to apply"
  type        = map(string)
  default     = {}
}

variable "egress_threshold" {
  description = "Network egress threshold in bytes"
  type        = number
  default     = 1000000000  # 1GB
}

resource "google_monitoring_alert_policy" "network_egress" {
  display_name = "Network High Egress Traffic"
  combiner = "OR"

  conditions {
    display_name = "Egress > ${var.egress_threshold / 1000000000}Gbps"

    condition_threshold {
      filter          = "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/network/sent_bytes_count\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = var.egress_threshold

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }

  notification_channels = [var.notification_channel_id]

  documentation {
    content   = "High network egress traffic detected. Monitor for data transfer costs and potential security issues."
    mime_type = "text/markdown"
  }

  user_labels = merge(var.common_labels, { severity = "info", resource = "network" })
}

output "alert_policy_id" {
  value = google_monitoring_alert_policy.network_egress.id
}