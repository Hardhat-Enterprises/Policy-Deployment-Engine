package terraform.gcp.security.backup_for_gke.backup_plan.backup_delete_lock_days

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars
import data.terraform.helpers.policies.range

violations := range.get_violations(
    vars.variables,
    ["retention_policy", 0, "backup_delete_lock_days"],
    [14, 90]
)

message := [m | 
    some violation in violations
    m := violation.message
]