package terraform.gcp.security.identity_aware_proxy.google_iap_app_engine_service_iam.role

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_app_engine_service_iam.vars

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
        "roles/run.invoker",
        "projects/my-gcp-project/roles/CustomBroadRole"
      ],
      "policy_type": "blacklist"
    }
  ]
]

# Summaries (same helper usage as member policy)
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
