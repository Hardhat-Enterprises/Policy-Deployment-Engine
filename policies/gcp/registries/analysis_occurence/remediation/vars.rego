package terraform.gcp.security.analysis_occurence.remediation.vars

variables := {
  "friendly_resource_name": "Container Analysis Occurrence (remediation)",
  "resource_type": "google_container_analysis_occurrence",
  "resource_value_name": "name",

  # Anything we consider "empty"/placeholder
  "banned_empty_values": ["", "none", "null", "placeholder", "example"],

  # Matches ANY non-base64 character in the string (so it's invalid)
  # (Base64 allowed set: A–Z a–z 0–9 + / and '=' padding)
  "banned_not_base64_regex": [
    "[^A-Za-z0-9+/=]"
  ],

  # Obviously bad public_key_id patterns: whitespace, '@' (email-like), or too short
  "banned_public_key_id_regex": [
    "\\s",        # any whitespace (space/newline/tab)
    "@",          # email-like id
    "^.{0,7}$"    # too short to be useful
  ],
}
