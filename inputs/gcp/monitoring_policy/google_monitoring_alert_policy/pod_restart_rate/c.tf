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

variable "restart_threshold" {
  description = "Pod restart threshold count"
  type        = number
  default     = 5
}

resource "google_monitoring_alert_policy" "pod_restart_rate" {
  display_name = "Pod Restart Rate Alert - ${var.cluster_name}"
  combiner = "OR"

  conditions {
    display_name = "Pods Restarting Frequently"

    condition_threshold {
      filter          = "resource.type = \"k8s_pod\" AND metric.type = \"kubernetes.io/container/restart_count\""
      duration        = "600s"
      comparison      = "COMPARISON_GT"
      threshold_value = var.restart_threshold

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }

  notification_channels = [var.notification_channel_id]

  documentation {
    content   = "High pod restart rate detected in ${var.cluster_name}. Check for application issues or resource constraints."
    mime_type = "text/markdown"
  }

  user_labels = merge(var.common_labels, { severity = "warning", resource = "k8s_pod" })
}

output "alert_policy_id" {
  value = google_monitoring_alert_policy.pod_restart_rate.id
}