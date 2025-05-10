package terraform.gcp.security.endpoints.service.service_name

import data.terraform.gcp.security.endpoints.service.vars
import data.terraform.gcp.helpers

conditions := [
  [
    # description + remedies
    {
      "situation_description": "Endpoints Service names must follow the standard pattern",
      "remedies": [
        "Make sure your service_name id of the form $api_name.endpoints.$project_id.cloud.goog"
      ]
    },
    # the actual check
    {
      "condition": "Service name must end with '.endpoints.<project>.cloud.goog'",
      "attribute_path": ["service_name"],
      "values":["my1-api.endpoints.my1-project-c.cloud.goog"],
      #"values": ["*.endpoints.*.cloud.goog", [["my1-api","my2-api","my3-api"],["my1-project-c","my2-project-c","my1-project-c"]]],
      "policy_type": "whitelist"
    }
  ]
]

#
# 3) delegate to the generic multi_summary helper
#
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


