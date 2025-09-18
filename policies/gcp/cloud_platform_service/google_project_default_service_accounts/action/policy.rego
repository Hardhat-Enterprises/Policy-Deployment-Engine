package terraform.gcp.security.cloud_platform_service.google_project_default_service_accounts.action

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_project_default_service_accounts.vars


conditions := [
    [
    {
      "situation_description": "Default service account 'action' must not be set to DELETE.",
      "remedies": [
        "Use 'DEPRIVILEGE' instead of 'DELETE' to comply with least privilege and avoid breakage."
      ]
    },
    {
        "condition": "Dangerous service account deletion",
        "attribute_path": ["action"],
        "values": ["DELETE"],
        "policy_type": "blacklist"
    }
    ],
    [
    {
    "situation_description": "'restore_policy' must not use REVERT_AND_IGNORE_FAILURE as it suppresses error feedback.",
    "remedies": ["Use 'REVERT' or 'NONE' instead of 'REVERT_AND_IGNORE_FAILURE'."]
    },
    {
        "condition": "Unreliable restore policy",
        "attribute_path": ["restore_policy"],
        "values": ["REVERT"],
        "policy_type": "whitelist"
    }
    ]
]
 
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

