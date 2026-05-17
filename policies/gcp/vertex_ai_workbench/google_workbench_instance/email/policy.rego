package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.email

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure a custom service account is specified. If omitted, the VM uses the default Compute Engine SA which has the Editor role on the entire project.",
      "remedies": ["Set gce_setup.service_accounts.email to a dedicated, least-privilege service account."]
    },
    {
      "condition": "service account email is not specified",
      "attribute_path": ["gce_setup", 0, "service_accounts", 0, "email"],
      "values": null,
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details