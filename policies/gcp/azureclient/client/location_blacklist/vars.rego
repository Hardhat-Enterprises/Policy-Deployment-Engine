package terraform.gcp.security.azureclient.client.location_blacklist

_meta_ := {
  "id": "GCP_AZURE_CLIENT_LOCATION_BLACKLIST",
  "version": "1.0.0",
  "title": "Disallowed Locations for GCP Azure Clients",
  "description": "Ensure GCP Azure Clients are not deployed in disallowed Azure regions.",
  "related_resources": [],
  "custom": {}
}

_input_path_ := "planned_values.root_module.resources"
_resource_type_ := "google_container_azure_client"

_blacklist_ := {
  "field": "location",
  "values": ["australiaeast", "unapproved-region"]
}