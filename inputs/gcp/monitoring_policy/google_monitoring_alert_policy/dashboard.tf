resource "google_monitoring_dashboard" "main" {
  dashboard_json = <<EOT
{
  "displayName": "Production Monitoring Dashboard",
  "gridLayout": {
    "columns": 2,
    "widgets": [
      { "title": "Cluster CPU Usage", "xyChart": {} },
      { "title": "Node Memory Usage", "xyChart": {} },
      { "title": "Pod Restarts", "xyChart": {} },
      { "title": "Persistent Volume Usage", "xyChart": {} },
      { "title": "CPU Throttling", "xyChart": {} },
      { "title": "LB Error Rate", "xyChart": {} },
      { "title": "Cloud SQL CPU", "xyChart": {} },
      { "title": "Network Egress", "xyChart": {} },
      { "title": "Instance Uptime", "xyChart": {} },
      { "title": "API Latency", "xyChart": {} }
    ]
  }
}
EOT
}
