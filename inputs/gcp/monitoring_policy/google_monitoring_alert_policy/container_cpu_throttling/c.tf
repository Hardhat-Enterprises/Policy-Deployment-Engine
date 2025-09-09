variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

variable "notification_channel_id" {
  description = "Notification channel ID"
  type        = string
}

variable "common_labels" {
  description = "Common labels to apply"
  type        = map(string)
  default     = {}
}

variable "throttling_threshold" {
  description = "CPU throttling threshold (0.0 to 1.0)"
  type        = number
  default     = 0.2
}

resource "google_monitoring_alert_policy" "container_cpu_throttling" {
  display_name = "Container CPU Throttling - ${var.cluster_name}"
  combiner = "OR"

  conditions {
    display_name = "CPU Throttle > ${var.throttling_threshold * 100}%"

    condition_threshold {
      filter          = "resource.type = \"k8s_container\" AND metric.type = \"kubernetes.io/container/cpu/cpu_throttling_ratio\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = var.throttling_threshold

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = [var.notification_channel_id]

  documentation {
    content   = "High CPU throttling detected in ${var.cluster_name}. Consider increasing CPU limits or optimizing workloads."
    mime_type = "text/markdown"
  }

  user_labels = merge(var.common_labels, { severity = "warning", resource = "k8s_container" })
}

output "alert_policy_id" {
  value = google_monitoring_alert_policy.container_cpu_throttling.id
}