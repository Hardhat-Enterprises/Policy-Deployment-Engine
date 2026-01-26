package terraform.gcp.security.dataform.google_dataform_repository_workflow_config.service_account_required

import data.terraform.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository_workflow_config as repo

# Require a service account in invocation_config
# NOTE: Terraform encodes nested blocks as single-element arrays in plan JSON.
# Path uses index 0 to reach service_account.

conditions := [
  [
    {
      "situation_description": "Workflow invocations must run with an explicit service account",
      "remedies": [
        "Set invocation_config.service_account to a valid service account email",
        "Ensure the service account has required permissions to execute Dataform actions"
      ]
    },
    {
      "condition": "invocation_config is configured",
      "attribute_path": ["invocation_config"],
      "policy_type": "whitelist",
      "values": [null, []]
    },
    {
      "condition": "service_account must be set",
      "attribute_path": ["invocation_config", 0, "service_account"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ]
]

message := helpers.get_multi_summary(conditions, repo.variables).message
details := helpers.get_multi_summary(conditions, repo.variables).details