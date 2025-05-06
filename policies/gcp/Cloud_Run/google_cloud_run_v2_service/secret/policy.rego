package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.secret

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars

conditions := [
  [
    {
      "situation_description": "Hardcoded secret found in container environment variables.",
      "remedies": [
        "Use 'secret_key_ref' or volumes to securely reference secrets.",
        "Avoid placing sensitive values in 'env.value'."
      ]
    },
    {
      "condition": "Container uses a hardcoded secret in env[0].value",
      "attribute_path": ["template", "containers", 0, "env", 0, "value"],
      "values": ["my-super-secret"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
