package terraform.gcp.security.identity_aware_proxy.google_iap_app_engine_service_iam_member.role

import data.terraform.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_app_engine_service_iam_member.vars

# SECURITY POLICY for `role` (exact-match, helper-friendly)
# Goal: Only allow the least-privilege IAP accessor role.
# Blocks common misuses: owner/editor/viewer, IAP admin, wrong product role, custom role.

conditions := [
  # 1) Allowlist the only correct role for App Engine IAP web access
  [
    {
      "situation_description": "Role must be least-privilege accessor",
      "remedies": [
        "Use roles/iap.httpsResourceAccessor"
      ]
    },
    {
      "condition": "role must be roles/iap.httpsResourceAccessor",
      "attribute_path": ["role"],
      "values": ["roles/iap.httpsResourceAccessor"],
      "policy_type": "whitelist"
    }
  ],

  # 2) Explicitly block especially risky/wrong roles (clearer messages)
  [
    {
      "situation_description": "Overly broad or wrong roles are not allowed",
      "remedies": [
        "Replace with roles/iap.httpsResourceAccessor"
      ]
    },
    {
      "condition": "role must not be broad/wrong",
      "attribute_path": ["role"],
      "values": [
        "roles/owner",
        "roles/editor",
        "roles/viewer",
        "roles/iap.admin",
        "roles/run.invoker"
      ],
      "policy_type": "blacklist"
    }
  ],

  # 3) The same broad custom role, in whichever project it was defined
  [
    {
      "situation_description": "Broad custom project roles are not allowed on IAP",
      "remedies": [
        "Replace with roles/iap.httpsResourceAccessor"
      ]
    },
    {
      "condition": "role must not be a broad custom project role",
      "attribute_path": ["role"],
      "values": ["projects/*/roles/*", [[], ["CustomBroadRole"]]],
      "policy_type": "pattern blacklist"
    }
  ]
]

# Summaries (same helper usage as member policy)
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
