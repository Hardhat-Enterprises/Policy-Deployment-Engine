package terraform.gcp.security.identity_aware_proxy.google_iap_web_backend_service_iam.role

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_web_backend_service_iam as vars

conditions := [
  # Allow only the least-privilege accessor role
  [
    {
      "situation_description": "Role must be least-privilege accessor",
      "remedies": ["Use roles/iap.httpsResourceAccessor"]
    },
    {
      "condition": "role must be roles/iap.httpsResourceAccessor",
      "attribute_path": ["role"],
      "values": ["roles/iap.httpsResourceAccessor"],
      "policy_type": "whitelist"
    }
  ],
  # Block common wrong/broad roles
  [
    {
      "situation_description": "Overly broad or wrong roles are not allowed",
      "remedies": ["Replace with roles/iap.httpsResourceAccessor"]
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

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
