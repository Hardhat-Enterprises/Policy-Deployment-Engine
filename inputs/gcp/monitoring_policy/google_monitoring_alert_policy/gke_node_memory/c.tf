variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

variable "memory_threshold" {
  description = "Memory threshold percentage"
  type        = number
  default     = 80
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

resource "google_monitoring_alert_policy" "gke_node_memory" {
  display_name = "GKE Node High Memory Usage - ${var.cluster_name}"
  combiner = "OR"

  conditions {
    display_name = "Memory > ${var.memory_threshold}%"

    condition_threshold {
      filter          = "resource.type = \"k8s_node\" AND metric.type = \"kubernetes.io/node/memory/allocatable_utilization\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = var.memory_threshold / 100

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = [var.notification_channel_id]

  documentation {
    content   = "High memory usage on ${var.cluster_name} nodes. Consider scaling or optimizing workloads."
    mime_type = "text/markdown"
  }

  user_labels = merge(var.common_labels, { severity = "warning", resource = "gke_node" })
}

output "alert_policy_id" {
  value = google_monitoring_alert_policy.gke_node_memory.id
}