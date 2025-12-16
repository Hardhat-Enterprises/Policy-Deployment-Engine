package terraform.gcp.security.backup_for_gke.restore_plan_iam.project_roles

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam.vars
import data.terraform.helpers.policies.blacklist

# Prevent project-wide roles for restore plans
violations := blacklist.get_violations(
    vars.variables,
    ["role"],
    ["roles/gkebackup.admin", "roles/gkebackup.restoreAdmin"]
)

message := [m | 
    some violation in violations
    m := violation.message
]