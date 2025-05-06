package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.secret

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.vars

conditions := [
  [
    {
      "situation_description": "Hardcoded secrets found in environment variables",
      "remedies": ["Use Secret Manager references instead of plain text in 'env.value'"]
    },
    {
      "condition": "Ensure no container environment variable uses plain text value",
      "attribute_path": ["template", "template", "containers", 0, "env", 0, "value"],
      "values": ["hardcoded-password"],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Missing secret volume mounts",
      "remedies": ["Mount secrets securely using 'volumes.secret.secret'"]
    },
    {
      "condition": "Ensure volumes.secret.secret is defined correctly",
      "attribute_path": ["template", "template", "volumes", 0, "secret", "secret"],
      "values": ["my-secret"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
