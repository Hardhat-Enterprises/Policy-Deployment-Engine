package terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway.hubs_region_whitelist

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway.vars

conditions := [
  [
    {
      "situation_description": "Security Gateway hubs are deployed outside the approved region.",
      "remedies": ["Use 'australia-southeast1' or 'australia-southeast2' for all hubs.region."]
    },
    {
      "condition": "Hubs region must be 'australia-southeast1' or 'australia-southeast2'",
      "attribute_path": ["hubs", 0, "region"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
