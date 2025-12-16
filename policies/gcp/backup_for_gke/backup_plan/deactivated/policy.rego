package terraform.gcp.security.backup_for_gke.backup_plan.deactivated

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars
import data.terraform.helpers.policies.blacklist

# Backup plans should not be deactivated
violations := blacklist.get_violations(
    vars.variables,
    ["deactivated"],
    [true]
)

message := [m | 
    some violation in violations
    m := violation.message
]