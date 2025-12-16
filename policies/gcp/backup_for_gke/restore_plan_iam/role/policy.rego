package terraform.gcp.security.backup_for_gke.restore_plan_iam.role

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam.vars
import data.terraform.helpers.policies.blacklist

# Blacklist overly permissive roles
violations := blacklist.get_violations(
    vars.variables,
    ["role"],
    ["roles/owner", "roles/editor", "roles/gkebackup.admin"]
)

message := [m | 
    some violation in violations
    m := violation.message
]