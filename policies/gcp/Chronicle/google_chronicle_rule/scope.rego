package terraform.gcp.security.chronicle.google_chronicle_rule.scope

import data.terraform.helpers
import data.terraform.gcp.security.chronicle.google_chronicle_rule.vars

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
      # Anchored on the location segment only: a pattern target constrains the
      # segments it captures, so naming the project and instance here would pin
      # them without checking them.
      "values": ["locations/*/instances/",
      [["australia-southeast1"]]],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
