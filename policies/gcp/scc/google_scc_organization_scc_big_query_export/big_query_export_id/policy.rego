package terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.big_query_export_id

import data.terraform.helpers
import data.terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.vars

conditions := [
  [
    {
      "situation_description": "Export ID must be from the approved allowlist.",
      "remedies": [
        "Use one of the approved export IDs (e.g., scc_export_prod_australia-southeast1)."
      ]
    },
    {
      "condition": "Export ID must match the approved list.",
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

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
