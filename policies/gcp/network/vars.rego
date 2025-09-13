package terraform.gcp.security.service_networking.network.vars

variables := {
  "friendly_resource_name": "Service Networking Connection (network)",
  "resource_type": "google_service_networking_connection",
  "resource_value_name": "network",

  # Networks that must NOT be used for service networking connections
  "banned_networks": [
    "projects/sixth-oxygen-468910-f1/global/networks/default",
    "projects/sixth-oxygen-468910-f1/global/networks/dev",
    "projects/sixth-oxygen-468910-f1/global/networks/test"
  ]
}
