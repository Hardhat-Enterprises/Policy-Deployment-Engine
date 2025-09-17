package terraform.gcp.security.service_networking.connection.vars

variables := {
  "friendly_resource_name": "Service Networking Connection",
  "resource_type": "google_service_networking_connection",
  "resource_value_name": "network",

  # ✅ Allowed reserved peering ranges (whitelist)
  "allowed_ip_ranges": [
    "10.0.0.0/24",
    "192.168.1.0/24",
    "172.16.0.0/16",
  ],
}
