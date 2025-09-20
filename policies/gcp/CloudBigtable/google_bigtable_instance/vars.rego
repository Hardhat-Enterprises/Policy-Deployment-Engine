package terraform.gcp.security.google_kms.google_kms_ekm_connection.vars

variables := {
  "friendly_resource_name": "KMS EKM Connection",
  "resource_type": "google_kms_ekm_connection",
  "resource_value_name": "name",
  "attribute_path": ["labels"],
  "required_labels": [
    {"key":"label1","equals":"v1"},
    {"key":"label2","equals":"v2"},
    # etc.
  ]
}
