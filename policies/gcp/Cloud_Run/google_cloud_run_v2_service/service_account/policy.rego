package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.service_account

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run v2 Service does not specify a secure service account",
      "remedies": [
        "Specify a secure, least-privilege service account using the 'service_account' attribute in the template"
      ]
    },
    {
      "condition": "Ensure a specific service account is used",
      "attribute_path": ["template", "service_account"],
      "values": ["my-custom-sa@my-project.iam.gserviceaccount.com"],
      "policy_type": "whitelist"
    }
  ]
]

# Summary message for OPA evaluation
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance evaluation for each resource
details := helpers.get_multi_summary(conditions, vars.variables).details
