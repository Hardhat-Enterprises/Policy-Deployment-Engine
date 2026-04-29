package terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.disable_proxy_access

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure the Workbench proxy is not disabled. The proxy enforces IAM authentication to JupyterLab. Disabling it removes this access control layer.",
      "remedies": ["Set disable_proxy_access to false or omit the field (defaults to false)."]
    },
    {
      "condition": "disable_proxy_access is set to true",
      "attribute_path": ["disable_proxy_access"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
