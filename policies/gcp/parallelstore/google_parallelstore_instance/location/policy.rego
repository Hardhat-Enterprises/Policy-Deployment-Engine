package terraform.gcp.security.parallelstore.google_parallelstore_instance.location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.parallelstore.google_parallelstore_instance.vars

__rego_metadata__ := {
  "id": "GCP_PARALLELSTORE_LOCATION_WHITELIST",
  "title": "Parallelstore: enforce allowed location",
  "description": "Only allow google_parallelstore_instance resources in australia-southeast1.",
  "severity": "medium",
  "type": helpers.get_policy_type("whitelist")
}

# One scenario (s1) with one condition (c1) using the helpers template
situations := [
  {
    "situation_description": "Parallelstore instance must be deployed in australia-southeast1",
    "remedies": ["Set location to australia-southeast1"],
    "c1": {
      "condition": "Location whitelist",
      "attribute_path": ["location"],
      "values": ["australia-southeast1"],
      "policy_type": "whitelist"
    }
  }
]

# Standard PDE outputs
message := helpers.get_multi_summary(situations, variables).message
details := helpers.get_multi_summary(situations, variables).details
