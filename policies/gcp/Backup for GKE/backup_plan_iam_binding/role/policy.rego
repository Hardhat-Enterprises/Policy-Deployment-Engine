package terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.role

import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.vars

# Merged policy for `role` — 3 independent scenarios.
conditions := [
{
    "situation_description": "Backup Plan IAM role must not be permissive.",
    "remedies": ["Do not use owner, editor, or gkebackup.admin roles."],
    "condition": "Role must not be permissive",
    "attribute_path": ["role"],
    "values": ["roles/owner", "roles/editor", "roles/gkebackup.admin", "roles/iam.securityAdmin", "roles/resourcemanager.organizationAdmin"],
    "policy_type": "blacklist"
  },
[
    {
      "situation_description": "Custom roles should not be used in Backup Plan IAM.",
      "remedies": ["Use predefined roles instead of custom roles."]
    },
    {
      "condition": "Role must not be a custom role",
      "attribute_path": ["role"],
      "values": ["roles/gkebackup.backupViewer", "roles/gkebackup.admin", "roles/gkebackup.viewer", "roles/iam.serviceAccountUser"],
      "policy_type": "whitelist"
    }
  ],
[
    {
      "situation_description": "Backup Plan IAM role must not be project-wide admin.",
      "remedies": ["Use more granular roles."]
    },
    {
      "condition": "Role must not be gkebackup.admin or backupAdmin",
      "attribute_path": ["role"],
      "values": ["roles/gkebackup.admin", "roles/gkebackup.backupAdmin"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
