package terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.allowed_organization

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.vars

conditions := [
  [
    {
      "situation_description": "BigQuery export must use an approved organization.",
      "remedies": [
        "Set organization to organizations/123456789"
      ]
    },
    {
      "condition": "Check organization is approved",
      "attribute_path": ["organization"],
      "values": ["organizations/123456789"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
