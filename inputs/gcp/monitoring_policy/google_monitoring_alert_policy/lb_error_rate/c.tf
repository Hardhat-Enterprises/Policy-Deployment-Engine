variable "notification_channel_id" {
  description = "Notification channel ID"
  type        = string
}

variable "common_labels" {
  description = "Common labels to apply"
  type        = map(string)
  default     = {}
}

variable "error_rate_threshold" {
  description = "Error rate threshold (0.0 to 1.0)"
  type        = number
  default     = 0.05
}

resource "google_monitoring_alert_policy" "lb_error_rate" {
  display_name = "Load Balancer High Error Rate"
  combiner = "OR"

  conditions {
    display_name = "HTTP 5xx > ${var.error_rate_threshold * 100}%"

    condition_threshold {
      filter          = "resource.type = \"https_lb_rule\" AND metric.type = \"loadbalancing.googleapis.com/https/request_count\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = var.error_rate_threshold

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }

  notification_channels = [var.notification_channel_id]

  documentation {
    content   = "High error rate detected on load balancer. Check backend health and application logs."
    mime_type = "text/markdown"
  }

  user_labels = merge(var.common_labels, { severity = "critical", resource = "load_balancer" })
}

output "alert_policy_id" {
  value = google_monitoring_alert_policy.lb_error_rate.id
}