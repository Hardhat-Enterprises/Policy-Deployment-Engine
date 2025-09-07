package terraform.gcp.security.cloud_platform_service.google_project_service.service

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_project_service.vars


conditions := [
   [
     {
      "situation_description": "IAM API must be enabled to manage identities securely",
      "remedies": ["Set service = 'iam.googleapis.com' to enable IAM functionality"]
    },
    {
      "condition": "IAM API not enabled",
      "attribute_path": ["service"],
      "values": ["iam.googleapis.com"],
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

