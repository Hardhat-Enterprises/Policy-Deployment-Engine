package terraform.gcp.security.scc.google_scc_source_iam_binding.role

import data.terraform.helpers
import data.terraform.gcp.security.scc.google_scc_source_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Binding must use an approved role.",
      "remedies": [
        "Use one of the approved Security Command Center roles (e.g., roles/securitycenter.findingsEditor)."
      ]
    },
    {
      "condition": "Role must be from the approved allowlist.",
      "attribute_path": ["role"],
      "values": [
        "roles/securitycenter.findingsViewer",
        "roles/securitycenter.findingsEditor",
        "roles/securitycenter.findingsStateSetter"
      ],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
