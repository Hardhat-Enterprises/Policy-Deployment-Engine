# outputs.tf - Place this in the root google_monitoring_alert_policy directory

output "alert_policy_ids" {
  value = {
    gke_cluster_cpu          = module.gke_cluster_cpu.alert_policy_id
    gke_node_memory          = module.gke_node_memory.alert_policy_id
    pod_restart_rate         = module.pod_restart_rate.alert_policy_id
    pv_disk_usage            = module.pv_disk_usage.alert_policy_id
    container_cpu_throttling = module.container_cpu_throttling.alert_policy_id
    lb_error_rate            = module.lb_error_rate.alert_policy_id
    cloudsql_cpu             = module.cloudsql_cpu.alert_policy_id
    network_egress           = module.network_egress.alert_policy_id
    instance_uptime          = module.instance_uptime.alert_policy_id
    api_latency              = module.api_latency.alert_policy_id
  }
}

output "notification_channel_id" {
  value = google_monitoring_notification_channel.email.id
}

output "dashboard_id" {
  value = google_monitoring_dashboard.main.id
}