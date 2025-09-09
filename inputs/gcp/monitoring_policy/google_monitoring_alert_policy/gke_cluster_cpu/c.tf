# gke_cluster_cpu/main.tf - Replace the entire content with this

variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

variable "cpu_threshold" {
  description = "CPU threshold percentage"
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

resource "google_monitoring_alert_policy" "gke_cluster_cpu" {
  display_name = "GKE Cluster High CPU Usage - ${var.cluster_name}"
  combiner     = "OR"

  conditions {
    display_name = "CPU > ${var.cpu_threshold}%"

    condition_threshold {
      filter          = "resource.type = \"k8s_cluster\" AND resource.labels.cluster_name = \"${var.cluster_name}\" AND metric.type = \"kubernetes.io/node/cpu/allocatable_utilization\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = var.cpu_threshold / 100

      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_MEAN"
        group_by_fields      = ["resource.node_name"]
      }
    }
  }

  notification_channels = [var.notification_channel_id]

  documentation {
    content   = "High CPU usage on ${var.cluster_name}. Consider scaling nodes."
    mime_type = "text/markdown"
  }

  user_labels = merge(var.common_labels, { severity = "warning", resource = "gke_cluster" })
}

output "alert_policy_id" {
  value = google_monitoring_alert_policy.gke_cluster_cpu.id
}