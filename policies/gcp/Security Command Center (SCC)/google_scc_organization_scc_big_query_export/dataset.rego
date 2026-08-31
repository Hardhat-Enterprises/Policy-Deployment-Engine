package terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.dataset

import data.terraform.helpers
import data.terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.vars

# policy_lint reports hard-coded-value on the value below, and the finding stands.
# A pattern whitelist only judges values that MATCH its target: one that does not
# match the shape is never flagged at all. This argument's non-compliant example
# is a bare name with no "projects/.../datasets/" path, so converting would make the fixture pass for the wrong
# reason. Either _helpers needs a pattern whitelist that fails a non-matching
# value, or the fixture needs a wrongly-scoped (not malformed) example.
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


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
