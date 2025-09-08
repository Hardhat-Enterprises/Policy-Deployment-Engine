
package terraform.gcp.security.beyondcorp.google_beyondcorp_app_connector.region_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_connector.vars

conditions := [
  [
    {
      "situation_description": "AppConnection is created in a region outside the approved Australia region.",
      "remedies": ["Use region 'australia-southeast1' only."]
    },
    {
      "condition": "Region must be inside the approved one",
      "attribute_path": ["region"],
      "values": ["australia-southeast1"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
