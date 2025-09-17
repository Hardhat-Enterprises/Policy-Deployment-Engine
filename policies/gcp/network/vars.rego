package terraform.gcp.security.service_networking.network.vars

variables := {
  "friendly_resource_name": "Service Networking Network",
  "resource_type": "google_service_networking_connection",
  "resource_value_name": "network",

  # ✅ Approved (whitelisted) networks
  "allowed_networks": [
    "projects/myproject/global/networks/production-vpc",
    "projects/myproject/global/networks/shared-services-vpc",
  ],
}
