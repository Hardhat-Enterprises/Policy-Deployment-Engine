variable "notification_channel_id" {
  description = "Notification channel ID"
  type        = string
}

variable "common_labels" {
  description = "Common labels to apply"
  type        = map(string)
  default     = {}
}

variable "sql_cpu_threshold" {
  description = "Cloud SQL CPU threshold (0.0 to 1.0)"
  type        = number
  default     = 0.8
}

resource "google_monitoring_alert_policy" "cloudsql_cpu" {
  display_name = "Cloud SQL High CPU"
  combiner = "OR"

  conditions {
    display_name = "CPU > ${var.sql_cpu_threshold * 100}%"

    condition_threshold {
      filter          = "resource.type = \"cloudsql_database\" AND metric.type = \"cloudsql.googleapis.com/database/cpu/utilization\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = var.sql_cpu_threshold

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = [var.notification_channel_id]

  documentation {
    content   = "High CPU usage on Cloud SQL instance. Consider optimizing queries or scaling up."
    mime_type = "text/markdown"
  }

  user_labels = merge(var.common_labels, { severity = "warning", resource = "cloudsql" })
}

output "alert_policy_id" {
  value = google_monitoring_alert_policy.cloudsql_cpu.id
}
