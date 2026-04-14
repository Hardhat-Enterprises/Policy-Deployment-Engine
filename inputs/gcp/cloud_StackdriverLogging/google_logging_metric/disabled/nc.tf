# Non-compliant: Metric is disabled
resource "google_logging_metric" "nc" {
  name        = "disabled-iam-metric"
  project     = "my-project"
  description = "This metric is disabled - VIOLATION"
  disabled    = true

  filter = "resource.type=\"iam_role\" AND (protoPayload.methodName=\"CreateRole\" OR protoPayload.methodName=\"UpdateRole\" OR protoPayload.methodName=\"DeleteRole\")"

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}

# Non-compliant: Another disabled security metric
resource "google_logging_metric" "nc2" {
  name        = "disabled-firewall-metric"
  project     = "my-project"
  description = "Firewall metric disabled - VIOLATION"
  disabled    = true

  filter = "resource.type=\"gce_firewall_rule\" AND (protoPayload.methodName=\"compute.firewalls.insert\" OR protoPayload.methodName=\"compute.firewalls.patch\" OR protoPayload.methodName=\"compute.firewalls.delete\")"

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}