package terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.big_query_export_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.vars

conditions := [
  [
    {
      "situation_description": "BigQuery export ID must be from the approved allowlist.",
      "remedies": [
        "Use one of the approved export IDs (e.g., scc_export_prod_australia-southeast1, scc_export_prod_us-central1)"
      ]
    },
    {
      "condition": "Check export ID is approved",
      "attribute_path": ["big_query_export_id"],
      "values": [
        "scc_export_prod_australia-southeast1",
        "scc_export_prod_us-central1",
        "scc_export_prod_europe-west1"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
