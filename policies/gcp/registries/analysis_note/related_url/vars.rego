package terraform.gcp.security.analysis_note.related_url.vars

inherited/gcp/service/container_registeries
variables := {
  "friendly_resource_name": "Container Analysis Note related_url",
  "resource_type": "google_container_analysis_note",
  "resource_value_name": "name",

  # A) Exact values never allowed
  "banned_related_url_exact": [
    "", "about:blank", "#", "placeholder", "example"
  ],

  # B) Banned schemes (case-insensitive)
  #    Enforces HTTPS only.
  "banned_related_url_scheme_regex": [
    "^(?i)(?:http|ftp|file|gopher|data|javascript|ws|wss):"
  ],

  # C) Banned hosts: localhost, metadata, and private IP ranges
  "banned_related_url_host_regex": [
    # localhost & loopback
    "^(?i)https?://(?:localhost|127\\.0\\.0\\.1|::1|0\\.0\\.0\\.0)(?:[:/]|$)",
    # GCP metadata endpoints
    "^(?i)https?://(?:metadata\\.google\\.internal|169\\.254\\.169\\.254)(?:[:/]|$)",
    # RFC1918 private ranges
    "^(?i)https?://10\\.(?:\\d{1,3}\\.){2}\\d{1,3}(?::\\d+)?(?:/|$)",
    "^(?i)https?://192\\.168\\.(?:\\d{1,3})\\.(?:\\d{1,3})(?::\\d+)?(?:/|$)",
    "^(?i)https?://172\\.(?:1[6-9]|2[0-9]|3[0-1])\\.(?:\\d{1,3})\\.(?:\\d{1,3})(?::\\d+)?(?:/|$)"
  ],

  # D) Banned embedded credentials (userinfo)
  "banned_related_url_userinfo_regex": [
    "://[^/]*@"
  ],


variables := {
    "friendly_resource_name": "", # eg., "GCS Bucket",
    "resource_type":  "", # eg., "google_storage_bucket"
    "resource_value_name" : "" # eg., "name"
gcp/service/container_registries
}
