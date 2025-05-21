package terraform.gcp.security.access_context_manager.google_access_context_manager_access_policy_iam_policy.members

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_context_manager.google_access_context_manager_access_policy_iam_policy.vars

conditions := [

  # ✅ Whitelist domain:deakin.edu.au only
  [
    {
      "situation_description": "Ensure only members from 'deakin.edu.au' domain are allowed.",
      "remedies": [
        "Use only 'domain:deakin.edu.au' in IAM bindings"
      ]
    },
    {
      "condition": "IAM policy members must only include 'domain:deakin.edu.au'",
      "attribute_path": ["policy_data", "bindings", 0, "members"],
      "values": ["domain:deakin.edu.au"],
      "policy_type": "whitelist"
    }
  ],

  # ✅ Blacklist public access members
  [
    {
      "situation_description": "Prevent use of broad or public members (like 'allUsers' or 'allAuthenticatedUsers').",
      "remedies": [
        "Do not include public members such as 'allUsers' or 'allAuthenticatedUsers'"
      ]
    },
    {
      "condition": "IAM policy should not include broad/public members",
      "attribute_path": ["policy_data", "bindings", 0, "members"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
