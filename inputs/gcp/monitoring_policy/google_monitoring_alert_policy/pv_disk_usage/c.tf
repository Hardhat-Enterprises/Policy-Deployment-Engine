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

variable "disk_usage_threshold" {
  description = "Disk usage threshold (0.0 to 1.0)"
  type        = number
  default     = 0.9
}

resource "google_monitoring_alert_policy" "pv_disk_usage" {
  display_name = "Persistent Volume High Disk Usage - ${var.cluster_name}"
  combiner = "OR"

  conditions {
    display_name = "PV Usage > ${var.disk_usage_threshold * 100}%"

    condition_threshold {
      filter          = "resource.type = \"k8s_pod\" AND metric.type = \"kubernetes.io/pod/volume/utilization\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = var.disk_usage_threshold

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = [var.notification_channel_id]

  documentation {
    content   = "High persistent volume usage in ${var.cluster_name}. Consider expanding storage or cleaning up data."
    mime_type = "text/markdown"
  }

  user_labels = merge(var.common_labels, { severity = "critical", resource = "persistent_volume" })
}

output "alert_policy_id" {
  value = google_monitoring_alert_policy.pv_disk_usage.id
}