package terraform.gcp.security.datastream.private_connection.approved_locations
import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.private_connection.vars

conditions := [
  [
  {"situation_description": "Private Connection uses a non-approved location.",
  "remedies": ["Use approved regions like australia-southeast1, us-central1, us-east1, or europe-west1."]},
  {
  "condition": "Checks if the location is within approved regions.",
  "attribute_path": ["location"],
  "values": ["us-central1", "us-east1", "europe-west1", "australia-southeast1"],
  "policy_type": "whitelist"
  }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
