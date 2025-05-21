package terraform.gcp.security.access_context_manager.access_level.required_access_levels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_context_manager.access_level.vars

conditions := [
  [
    {
      "situation_description": "Missing or misformatted required access level reference.",
      "remedies": [
        "Ensure each required access level uses the full format: accessPolicies/{policy_id}/accessLevels/{short_name}",
        "Ensure that only approved access levels are used"
      ]
    },
    {
      "condition": "Required access levels must be whitelisted and follow naming convention.",
      "attribute_path": ["required_access_levels"],
      "values": ["accessPolicies/123456789012/accessLevels/LEVEL_1", "accessPolicies/123456789012/accessLevels/LEVEL_2"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
