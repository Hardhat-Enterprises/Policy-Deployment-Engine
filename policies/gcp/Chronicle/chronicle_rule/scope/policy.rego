package terraform.gcp.security.Chronicle.chronicle_rule.scope

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Chronicle.chronicle_rule.vars

conditions := [

  # 1. Missing or empty scope
  [
    {
      "situation_description": "The Chronicle rule does not have a 'scope' defined, resulting in unrestricted access.",
      "remedies": [
        "Define a valid 'scope' to restrict the rule’s access to specific data using a data access scope.",
        "Ensure the scope is compatible with any reference lists used in the rule."
      ]
    },
    {
      "condition": "Missing or empty 'scope'",
      "attribute_path": ["scope"],
      "values": [""],
      "policy_type": "whitelist"
    }
  ],

  # 2. Invalid format of scope
  [
    {
      "situation_description": "The 'scope' attribute format is invalid — follow standard resource path format.",
      "remedies": [
        "Ensure the scope for:projects/{project}/locations/{location}/instances/{instance}/dataAccessScopes/{scope_id}."
      ]
    },
    {
      "condition": "Invalid 'scope' format",
      "attribute_path": ["scope"],
      "values": ["^projects/[^/]+/locations/[^/]+/instances/[^/]+/dataAccessScopes/[^/]+$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
