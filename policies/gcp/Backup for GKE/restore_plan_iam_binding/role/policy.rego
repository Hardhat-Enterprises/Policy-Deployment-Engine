package terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.role

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam_binding.vars

# Merged policy for `role` — 3 independent scenarios.
conditions := [
{
    "situation_description": "Restore Plan IAM role must not be permissive.",
    "remedies": ["Do not use owner, editor, or gkebackup.restoreAdmin roles."],
    "condition": "Role must not be permissive",
    "attribute_path": ["role"],
    "values": ["roles/owner", "roles/editor", "roles/gkebackup.restoreAdmin", "roles/iam.securityAdmin", "roles/resourcemanager.organizationAdmin"],
    "policy_type": "blacklist"
  },
[
    {
      "situation_description": "Restore Plan IAM role must not be project-wide admin.",
      "remedies": ["Use more granular roles."]
    },
    {
      "condition": "Role must not be gkebackup.admin or restoreAdmin",
      "attribute_path": ["role"],
      "values": ["roles/gkebackup.admin", "roles/gkebackup.restoreAdmin"],
      "policy_type": "blacklist"
    }
  ],
[
    {
      "situation_description": "Restore Plan IAM role must be allowed.",
      "remedies": ["Use roles/gkebackup.viewer or roles/gkebackup.restoreAgent."]
    },
    {
      "condition": "Role must be allowed",
      "attribute_path": ["role"],
      "values": ["roles/gkebackup.viewer", "roles/gkebackup.restoreAgent"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
