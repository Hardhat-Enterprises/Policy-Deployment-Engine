package terraform.gcp.security.scc.google_scc_source_iam_binding.allowed_role

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.google_scc_source_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "IAM Binding must use an approved role.",
      "remedies": [
        "Use the approved role: roles/securitycenter.findingsViewer"
      ]
    },
    {
      "condition": "Check role is approved",
      "attribute_path": ["role"],
      "values": [
        "roles/securitycenter.findingsViewer"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
