package terraform.gcp.security.datastream.connection_profile.approved_locations
import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.connection_profile.vars

conditions := [
  [
  {
  "situation_description": "Connection profile is deployed in an unapproved location.",
  "remedies": ["Use only approved locations such as 'us-central1', 'europe-west1', or 'australia-southeast1'.", "Avoid deploying in unsupported or deprecated regions."]},
  {
  "condition": "Checks if the location is within the approved set.",
  "attribute_path": ["location"],
  "values": ["us-central1", "europe-west1", "australia-southeast1"],
  "policy_type": "whitelist"
  }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
