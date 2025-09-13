package terraform.gcp.security.service_networking.connection.vars

variables := {
  "friendly_resource_name": "Service Networking Connection",
  "resource_type": "google_service_networking_connection",
  "resource_value_name": "network",

  # Disallowed ranges for private service connections
  "banned_ip_ranges": [
    "10.0.0.0/8",
    "192.168.0.0/16",
    "172.16.0.0/12"
  ]
}
