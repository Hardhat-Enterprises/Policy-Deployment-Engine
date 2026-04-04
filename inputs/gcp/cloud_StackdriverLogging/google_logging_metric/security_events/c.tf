# Compliant: Metric for IAM role changes
resource "google_logging_metric" "c_iam_role_changes" {
  name        = "iam-role-changes-metric"
  project     = "my-project"
  description = "Metric for IAM role creation/modification"

  filter = "resource.type=\"iam_role\" AND (protoPayload.methodName=\"CreateRole\" OR protoPayload.methodName=\"UpdateRole\" OR protoPayload.methodName=\"DeleteRole\")"

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}

# Compliant: Metric for firewall rule changes
resource "google_logging_metric" "c_firewall_changes" {
  name        = "firewall-changes-metric"
  project     = "my-project"
  description = "Metric for firewall rule changes"

  filter = "resource.type=\"gce_firewall_rule\" AND (protoPayload.methodName=\"compute.firewalls.insert\" OR protoPayload.methodName=\"compute.firewalls.patch\" OR protoPayload.methodName=\"compute.firewalls.delete\")"

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}

# Compliant: Metric for storage bucket IAM changes
resource "google_logging_metric" "c_bucket_iam_changes" {
  name        = "bucket-iam-changes-metric"
  project     = "my-project"
  description = "Metric for Cloud Storage bucket IAM changes"

  filter = "resource.type=\"gcs_bucket\" AND protoPayload.methodName=\"storage.setIamPermissions\""

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}

# Compliant: Metric for service account key creation
resource "google_logging_metric" "c_sa_key_creation" {
  name        = "sa-key-creation-metric"
  project     = "my-project"
  description = "Metric for service account key creation"

  filter = "resource.type=\"service_account\" AND protoPayload.methodName=\"google.iam.admin.v1.CreateServiceAccountKey\""

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}