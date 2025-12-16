package terraform.gcp.security.backup_for_gke.restore_plan_iam.restore_permissions

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam.vars
import data.terraform.helpers.policies.whitelist

# Only allow specific restore permissions
violations := whitelist.get_violations(
    vars.variables,
    ["role"],
    ["roles/gkebackup.viewer", "roles/gkebackup.restoreAgent"]
)

message := [m | 
    some violation in violations
    m := violation.message
]