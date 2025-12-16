package terraform.gcp.security.backup_for_gke.backup_plan_iam.project_roles

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam.vars
import data.terraform.helpers.policies.blacklist

# Prevent project-wide roles for backup plans
violations := blacklist.get_violations(
    vars.variables,
    ["role"],
    ["roles/gkebackup.admin", "roles/gkebackup.backupAdmin"]
)

message := [m | 
    some violation in violations
    m := violation.message
]