package terraform.gcp.security.analysis_note.expiration_time.vars

variables := {
  "friendly_resource_name": "Container Analysis Note (expiration_time)",
  "resource_type": "google_container_analysis_note",
  "resource_value_name": "name",

  # Values considered invalid/placeholder
  "banned_expiration_time_values": [
    "", "0", "null", "placeholder", "example", "1970-01-01T00:00:00Z"
  ],

  # Maximum expiry allowed in the future (e.g., 10 years from now)
  # Helpers will use range policy [min, max].
  "max_expiration_year": 2035
}
