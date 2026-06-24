package terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application.upstreams_egress_policy_regions

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application.vars

conditions := [
    [
    {
      "situation_description": "Upstream egress policy uses unapproved regions.",
      "remedies": ["Use 'australia-southeast1' or 'australia-southeast2' only."]
    },
    {
      "condition": "Upstreams egress regions must be in the approved list.",
      "attribute_path": ["upstreams", 0 , "egress_policy", 0 , "regions"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details