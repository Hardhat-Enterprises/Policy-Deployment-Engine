package terraform.gcp.security.analysis_occurence.remediation.vars

variables := {
  "friendly_resource_name": "Container Analysis Occurrence (remediation)",
  "resource_type": "google_container_analysis_occurrence",
  "resource_value_name": "name",

  "banned_empty_values": [
    "", "none", "null", "placeholder", "example"
  ],

  # Characters not valid in base64 (patterns only; helpers do substring search)
  "banned_not_base64_character_patterns": [
    " ", "\t", "\n", "\r",
    "$", "?", ":", ";", ",", "@",
    "{", "}", "[", "]", "(", ")", "<", ">", "\\", "\"", "'", "`"
  ],

  # Simple invalid patterns for public_key_id
  "banned_public_key_id_patterns": [
    " ", "\t", "\n", "@"
  ],
}
