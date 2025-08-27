package terraform.gcp.security.analysis_note.expiration_time.vars

variables := {
  "friendly_resource_name": "Container Analysis Note expiration_time",
  "resource_type": "google_container_analysis_note",
  "resource_value_name": "address",  # ← safer than "name"

  "banned_expiration_exact": [
    "", "none", "never", "permanent",
    "1970-01-01T00:00:00Z"
  ],

  # ≥ 2036 considered “too far in future”
  "banned_expiration_far_future_regex": "^(?:203[6-9]|20[4-9]\\d|21\\d\\d|[3-9]\\d{3})-\\d{2}-\\d{2}T.*Z$"
}
