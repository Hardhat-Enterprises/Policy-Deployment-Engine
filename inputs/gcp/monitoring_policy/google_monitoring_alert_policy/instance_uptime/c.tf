variable "notification_channel_id" {
  description = "Notification channel ID"
  type        = string
}

variable "common_labels" {
  description = "Common labels to apply"
  type        = map(string)
  default     = {}
}

resource "google_monitoring_alert_policy" "instance_uptime" {
  display_name = "Instance Uptime Check Failed"
  combiner = "OR"

  conditions {
    display_name = "Instance Down"

    condition_threshold {
      filter          = "resource.type = \"gce_instance\" AND metric.type = \"uptime.googleapis.com/uptime_check/check_passed\""
      duration        = "120s"
      comparison      = "COMPARISON_LT"
      threshold_value = 1

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = [var.notification_channel_id]

  documentation {
    content   = "Instance uptime check failed. Verify instance health and connectivity."
    mime_type = "text/markdown"
  }

  user_labels = merge(var.common_labels, { severity = "critical", resource = "instance" })
}

output "alert_policy_id" {
  value = google_monitoring_alert_policy.instance_uptime.id
}