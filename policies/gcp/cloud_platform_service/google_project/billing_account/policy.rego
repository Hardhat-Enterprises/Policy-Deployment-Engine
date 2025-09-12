package terraform.gcp.security.cloud_platform_service.google_project.billing_account

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_project.vars

# Flag projects that have no billing account attached
conditions := [
    [
     {
      "situation_description": "Every project must have a billing account attached.",
      "remedies": ["Set billing_account to a valid billing account ID (e.g., 000000-000000-000000)."]
    },
    {
      "condition": "Missing billing account",
      "attribute_path": ["billing_account"],
      "values": [null, ""],   # catch null or empty
      "policy_type": "blacklist"
    }
  ]
]
 

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

