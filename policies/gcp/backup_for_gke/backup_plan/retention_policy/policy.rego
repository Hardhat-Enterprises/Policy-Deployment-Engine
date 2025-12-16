package terraform.gcp.security.backup_for_gke.backup_plan.retention_policy

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars
import data.terraform.helpers.policies.range

# Retention period in days (7 to 90 days)
violations := range.get_violations(
    vars.variables,
    ["retention_policy", 0, "backup_retain_days"],
    [7, 90]
)

message := [m | 
    some violation in violations
    m := violation.message
]