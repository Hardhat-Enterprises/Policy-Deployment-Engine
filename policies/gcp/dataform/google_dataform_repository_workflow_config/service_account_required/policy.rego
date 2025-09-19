package terraform.gcp.security.dataform.google_dataform_repository_workflow_config.service_account_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository_workflow_config.vars

conditions := [
  [
    {
      "situation_description": "Workflow config must specify a service account for execution.",
      "remedies": [
        "Set service_account in invocation_config block.",
        "Use a dedicated service account with minimal required permissions."
      ]
    },
    {
      "condition": "Service account must be defined",
      "attribute_path": ["invocation_config", "service_account"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Workflow config must specify a service account for execution.",
      "remedies": [
        "Set service_account in invocation_config block.",
        "Use a dedicated service account with minimal required permissions."
      ]
    },
    {
      "condition": "Service account must not be empty",
      "attribute_path": ["invocation_config", "service_account"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
