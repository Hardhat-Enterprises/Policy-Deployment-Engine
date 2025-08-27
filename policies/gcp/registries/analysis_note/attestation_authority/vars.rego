package terraform.gcp.security.analysis_note.attestation_authority.vars

variables := {
  # Shown in summaries
  "friendly_resource_name": "Container Analysis Note attestation_authority",

  # Terraform resource to scan
  "resource_type": "google_container_analysis_note",

  # Use "address" to avoid helper conflicts with "name"
  "resource_value_name": "address",

  # Exact strings we never accept for human_readable_name
  "banned_human_readable_names": [
    "", "none", "na", "n/a", "null", "test", "placeholder"
  ],

  # Allowed pattern for human_readable_name (2–64 chars)
  "allowed_human_readable_name_regex": "^[A-Za-z0-9 _-]{2,64}$"
}
