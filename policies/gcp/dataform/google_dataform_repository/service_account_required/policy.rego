package terraform.gcp.security.dataform.google_dataform_repository.service_account_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {
      "situation_description": "Dataform repository must have service_account configured.",
      "remedies": [
        "Set service_account for the repository.",
        "Use a dedicated service account with minimal required permissions."
      ]
    },
    {
      "condition": "service_account must not be null",
      "attribute_path": ["service_account"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository service_account cannot be empty.",
      "remedies": [
        "Set service_account to a non-empty value.",
        "Use a valid service account email."
      ]
    },
    {
      "condition": "service_account must not be empty",
      "attribute_path": ["service_account"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
