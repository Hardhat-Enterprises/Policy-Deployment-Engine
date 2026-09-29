package terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.deletion_policy

import data.terraform.helpers as helpers
import data.terraform.gcp.security.backup_for_gke.google_gke_backup_restore_plan.vars as vars

conditions := [[
  {
    "situation_description": "Restore Plan must be protected from accidental or unauthorized deletion.",
    "remedies": ["Set deletion_policy = PREVENT."],
  },
  {
    "condition": "deletion_policy must be PREVENT.",
    "attribute_path": ["deletion_policy"],
    "values": ["PREVENT"],
    "policy_type": "whitelist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details