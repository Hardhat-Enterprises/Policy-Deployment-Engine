variable "notification_channel_id" {
  description = "Notification channel ID"
  type        = string
}

variable "common_labels" {
  description = "Common labels to apply"
  type        = map(string)
  default     = {}
}

variable "latency_threshold" {
  description = "API latency threshold in milliseconds"
  type        = number
  default     = 500
}

resource "google_monitoring_alert_policy" "api_latency" {
  display_name = "API High Latency"
  combiner = "OR"

  conditions {
    display_name = "Latency > ${var.latency_threshold}ms"

    condition_threshold {
      filter          = "resource.type = \"api\" AND metric.type = \"apigee.googleapis.com/api/proxy/latency\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = var.latency_threshold

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = [var.notification_channel_id]

  documentation {
    content   = "High API latency detected. Check backend performance and network connectivity."
    mime_type = "text/markdown"
  }

  user_labels = merge(var.common_labels, { severity = "warning", resource = "api" })
}

output "alert_policy_id" {
  value = google_monitoring_alert_policy.api_latency.id
}