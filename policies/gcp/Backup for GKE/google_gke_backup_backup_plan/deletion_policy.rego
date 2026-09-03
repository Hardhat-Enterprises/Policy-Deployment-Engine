package terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.deletion_policy

import data.terraform.helpers as helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_backup_plan.vars as vars

conditions := [[
  {
    "situation_description": "Backup Plan must be protected from accidental deletion.",
    "remedies": ["Set deletion_policy = PREVENT."],
  },
  {
    "condition": "deletion_policy must be PREVENT.",
    "attribute_path": ["deletion_policy"],
    "values": ["PREVENT"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
