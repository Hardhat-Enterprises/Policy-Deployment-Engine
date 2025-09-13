package terraform.gcp.security.analysis_note.attestation_authority.vars

variables := {
  "friendly_resource_name": "Container Analysis Note (attestation_authority.name)",
  "resource_type": "google_container_analysis_note",
  "resource_value_name": "name",

  "banned_human_readable_names": [
    "", "name", "human_readable_name", "placeholder", "example",
    "dev", "development", "test", "testing", "stage", "staging",
    "sandbox", "demo", "tmp", "temp", "local"
  ],

  "banned_human_readable_name_patterns": [
    "dev", "test", "stage", "sandbox", "tmp", "temp", "demo"
  ],
}
