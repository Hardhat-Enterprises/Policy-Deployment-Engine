# Compliant: No disabled attribute (defaults to false)
resource "google_logging_metric" "c" {
  name        = "iam-role-changes-metric"
  project     = "my-project"
  description = "Metric for IAM role changes"

  filter = "resource.type=\"iam_role\" AND (protoPayload.methodName=\"CreateRole\" OR protoPayload.methodName=\"UpdateRole\" OR protoPayload.methodName=\"DeleteRole\")"

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}

# Compliant: Explicitly disabled = false
resource "google_logging_metric" "c2" {
  name        = "firewall-changes-metric"
  project     = "my-project"
  description = "Metric for firewall rule changes"
  disabled    = false

  filter = "resource.type=\"gce_firewall_rule\" AND (protoPayload.methodName=\"compute.firewalls.insert\" OR protoPayload.methodName=\"compute.firewalls.patch\" OR protoPayload.methodName=\"compute.firewalls.delete\")"

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}