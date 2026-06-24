
package terraform.gcp.security.beyondcorp.google_beyondcorp_app_connection.region

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_connection.vars

conditions := [
  [
    {
      "situation_description": "AppConnection is created in a region outside the approved Australia region.",
      "remedies": ["Use region 'australia-southeast1' or 'australia-southeast2' only."]
    },
    {
      "condition": "Region must be inside the approved one",
      "attribute_path": ["region"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
