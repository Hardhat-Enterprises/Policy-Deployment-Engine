package terraform.gcp.security.backup_for_gke.backup_plan.name

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars
import data.terraform.helpers.policies.pattern_whitelist

# Name must follow naming convention
violations := pattern_whitelist.get_violations(
    vars.variables,
    ["name"],
    ["gke-backup-plan-*", [[]]]
)

message := [m | 
    some violation in violations
    m := violation.message
]