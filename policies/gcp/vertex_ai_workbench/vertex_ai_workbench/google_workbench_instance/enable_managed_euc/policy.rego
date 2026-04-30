package terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.enable_managed_euc

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure managed end-user credentials (EUC) are enabled. Without EUC, API calls use the VM service account identity and audit logs will not reflect the actual user.",
      "remedies": ["Set enable_managed_euc to true."]
    },
    {
      "condition": "enable_managed_euc is not set to true",
      "attribute_path": ["enable_managed_euc"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
