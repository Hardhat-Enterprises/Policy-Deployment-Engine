package terraform.gcp.security.azureclient.client.location_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.client.vars

attribute_path := "location"
compliant_values := [
  "australia-southeast1",
  "us-central1",
  "europe-west1"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
