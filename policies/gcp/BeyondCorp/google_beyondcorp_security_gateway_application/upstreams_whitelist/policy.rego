package terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application.upstreams_whitelist

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
  ],
  [
    {
      "situation_description": "Upstream network is not in the approved set.",
      "remedies": ["Use only approved networks: prod-vpc, shared-services-vpc."]
    },
    {
      "condition": "Upstream network must be in the approved list [projects/{project}/global/networks/{network}].",
      "attribute_path": ["upstreams", 0 , "network", 0 , "name"],
      "values": ["projects/smooth-verve-467716-v1/global/networks/prod-vpc", 
      "projects/smooth-verve-467716-v1/global/networks/shared-services-vpc"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
