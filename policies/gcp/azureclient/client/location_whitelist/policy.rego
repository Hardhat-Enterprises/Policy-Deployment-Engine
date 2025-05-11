package terraform.gcp.containerazure.client

import data.terraform.gcp.helpers
import data.terraform.gcp.containerazure.client.vars

scenarios_list := [
  {
    "situation_description": "Location must be in approved region list",
    "remedies": ["Use a location from the approved list"],
    "condition": "location is not whitelisted",
    "attribute_path": ["location"],
    "values": ["australiaeast", "australiasoutheast", "uswest1"],
    "policy_type": "whitelist"
  }
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)

message := summary.message
detail := summary.details

/* package terraform.gcp.security.azureclient.client.location_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.client.vars

attribute_path := "location"
compliant_values := [
  "australia-southeast1",
  "us-central1",
  "europe-west1"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
*/