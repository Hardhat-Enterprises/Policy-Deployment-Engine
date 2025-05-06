package terraform.gcp.security.cloud_buildv2.connection.installation_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

# STEP 1: DEFINE SCENARIOS
scenarios_list := [
  [
    {
      "situation_description": "App installation ID is not approved",
      "remedies": ["Set 'app_installation_id' to 0 in github_config block"]
    },
    {
      "condition": "Check github_config.app_installation_id value",
      "attribute_path": ["github_config", "app_installation_id"],
      "values": [0],
      "policy_type": "whitelist"
    }
  ]
  
]
# STEP 2: APPLY NEW STRUCTURE FOR SUMMARY AND DETAILS
summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
