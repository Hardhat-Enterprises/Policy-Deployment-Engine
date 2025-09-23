package terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.dataset

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.vars

conditions := [
  [
    {
      "situation_description": "Dataset must be from the approved allowlist.",
      "remedies": [
        "Use one of the approved datasets (e.g., projects/my-project/datasets/security_exports)."
      ]
    },
    {
      "condition": "Dataset must match the approved list.",
      "attribute_path": ["dataset"],
      "values": [
        "projects/my-project/datasets/security_exports"
      ],
      "policy_type": "whitelist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
