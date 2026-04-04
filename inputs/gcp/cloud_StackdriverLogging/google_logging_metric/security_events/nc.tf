# Non-compliant: Only monitoring disk usage (non-security)
resource "google_logging_metric" "nc_disk_usage" {
  name        = "disk-usage-metric"
  project     = "my-project"
  description = "Metric for disk usage (non-security)"

  filter = "resource.type=\"gce_instance\" AND logName=\"disk-usage\""

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}

# Non-compliant: Missing all security event metrics
# No metrics for IAM, firewall, or service account changes
resource "google_logging_metric" "nc_http_requests" {
  name        = "http-requests-metric"
  project     = "my-project"
  description = "Metric for HTTP requests (non-security)"

  filter = "resource.type=\"http_load_balancer\""

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}