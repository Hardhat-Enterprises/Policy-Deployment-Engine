package terraform.gcp.security.cloud_buildv2.repository.parent_connection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.repository.vars

# Allow only secure and properly formatted parent_connection values
scenarios_list := [
  [
    {
      "situation_description": "The repository must use a secure and properly scoped parent_connection",
      "remedies": [
        "Use 'parent_connection' values that follow the approved format like 'projects/<project>/locations/global/connections/secure-connection'"
      ]
    },
    {
      "condition": "parent_connection must match secure naming patterns",
      "attribute_path": ["parent_connection"],
      "pattern_whitelist": ["projects/.+/locations/global/connections/secure-connection"],
      "policy_type": "pattern whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
