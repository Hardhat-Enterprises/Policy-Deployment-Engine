package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.enable_third_party_identity

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure third-party identity provider access is disabled. Enabling it broadens the trust boundary beyond Google Cloud IAM, introducing federated authentication risks.",
      "remedies": ["Set enable_third_party_identity to false or omit the field (defaults to false)."]
    },
    {
      "condition": "enable_third_party_identity is set to true",
      "attribute_path": ["enable_third_party_identity"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
