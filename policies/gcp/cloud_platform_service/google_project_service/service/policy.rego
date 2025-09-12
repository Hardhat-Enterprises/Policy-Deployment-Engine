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
 
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

