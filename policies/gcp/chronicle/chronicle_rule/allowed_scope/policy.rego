package terraform.gcp.security.chronicle.chronicle_rule.allowed_scope

import data.terraform.gcp.helpers
import data.terraform.gcp.security.chronicle.chronicle_rule.vars

conditions := [

  [
    {
      "situation_description": "It does not specify 'location' giving potentially unrestricted regional access",
      "remedies": [
       "Define a valid 'location' for the Chronicle rule to ensure it targets specific regions.",
        "Avoid using empty strings or null values in the 'location' attribute."
      ]
    },
    {
      "condition": "Missing or empty 'scope'",
      "attribute_path": ["scope"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ],

  
  [
    {
      "situation_description": "The 'location' attribute is not in the list of approved regions.",
      "remedies": [
        "Ensure the 'location' attribute contains only allowed regions like 'australia-southeast1'.",
        "Avoid using wildcard or non-standard values in the location field."
      ]
    },
    {
      "condition": "Invalid or disallowed 'location' value",
      "attribute_path": ["scope"],
      "values": ["projects/fake-project/locations/*/instances/audit-log-activity/dataAccessScopes/legitimatescope", 
      [["australia-southeast1"]]],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
