package terraform.gcp.security.backup_for_gke.restore_plan.description

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars
import data.terraform.helpers.policies.blacklist

# Description should not be empty or null
violations := blacklist.get_violations(
    vars.variables,
    ["description"],
    ["", null]
)

message := [m | 
    some violation in violations
    m := violation.message
]