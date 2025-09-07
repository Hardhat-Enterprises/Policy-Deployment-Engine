package terraform.gcp.security.cloud_platform_service.google_project.deletion_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_project.vars

# Enforce deletion guard at the project level
conditions := [
  [
    {
      "situation_description": "Projects must enable deletion protection.",
      "remedies": ["Set deletion_policy to PREVENT to avoid accidental deletion."]
    },
    {
      "condition": "Deletion protection not enabled",
      "attribute_path": ["deletion_policy"],
      "values": ["PREVENT"],
      "policy_type": "whitelist"
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

