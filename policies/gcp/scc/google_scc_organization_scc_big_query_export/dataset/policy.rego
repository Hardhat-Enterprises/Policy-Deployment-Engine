package terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.dataset

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.vars

conditions := [
  [
    {
      "situation_description": "BigQuery export must use an approved dataset.",
      "remedies": [
        "Set dataset to projects/my-project/datasets/security_exports"
      ]
    },
    {
      "condition": "Check dataset is approved",
      "attribute_path": ["dataset"],
      "values": ["projects/my-project/datasets/security_exports"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
