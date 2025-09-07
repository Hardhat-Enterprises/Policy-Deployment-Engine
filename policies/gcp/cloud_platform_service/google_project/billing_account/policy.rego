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
 




# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details

