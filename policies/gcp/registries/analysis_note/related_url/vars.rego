package terraform.gcp.security.analysis_note.related_url.vars

variables := {
  "friendly_resource_name": "Container Analysis Note (related_url)",
  "resource_type": "google_container_analysis_note",
  "resource_value_name": "name",

  "banned_related_url_exact": [
    "", "about:blank", "#", "placeholder", "example"
  ],

  "banned_related_url_scheme_patterns": [
    "http://", "ftp:", "file:", "data:", "javascript:", "ws:", "wss:"
  ],

  "banned_related_url_host_patterns": [
    "://localhost", "://127.0.0.1", "://::1", "://0.0.0.0",
    "://169.254.169.254", "://metadata.google.internal",
    "://10.", "://192.168.",
    "://172.16.", "://172.17.", "://172.18.", "://172.19.", "://172.20.",
    "://172.21.", "://172.22.", "://172.23.", "://172.24.", "://172.25.",
    "://172.26.", "://172.27.", "://172.28.", "://172.29.", "://172.30.", "://172.31."
  ],

  "banned_related_url_userinfo_patterns": [
    "@", "://:"
  ],
}
