# Non-compliant: Disabled IAM metric
resource "google_logging_metric" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  project     = "my-project"
  description = "Disabled IAM metric - VIOLATION"
  disabled    = true

  filter = "resource.type=\"iam_role\" AND (protoPayload.methodName=\"CreateRole\" OR protoPayload.methodName=\"UpdateRole\" OR protoPayload.methodName=\"DeleteRole\")"

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}

# Non-compliant: Disabled firewall metric
resource "google_logging_metric" "non_compliant_example_2" {
  name        = "non_compliant_example_2"
  project     = "my-project"
  description = "Disabled firewall metric - VIOLATION"
  disabled    = true

  filter = "resource.type=\"gce_firewall_rule\" AND (protoPayload.methodName=\"compute.firewalls.insert\" OR protoPayload.methodName=\"compute.firewalls.patch\" OR protoPayload.methodName=\"compute.firewalls.delete\")"

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}
