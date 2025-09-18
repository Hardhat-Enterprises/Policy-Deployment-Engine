package terraform.gcp.security.firebase_hosting.google_firebase_hosting_custom_domain.custom_domain_verification

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_custom_domain.vars

conditions := [
  [
    {
      "situation_description": "Custom domains must use automatic certificate management",
      "remedies": [
        "Set cert_preference to GROUPED or PROJECT_GROUPED to enable managed SSL certificates",
        "Avoid DEDICATED unless there is a strict operational requirement"
      ],
    },
    {
      "condition": "Validating cert_preference is automatic (managed)",
      "attribute_path": ["cert_preference"],
      "values": ["GROUPED", "PROJECT_GROUPED"],
      "policy_type": "whitelist",
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details