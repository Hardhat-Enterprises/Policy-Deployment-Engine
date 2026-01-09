package terraform.gcp.security.backup_for_gke.backup_plan.permissive_mode

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars
import data.terraform.helpers.policies.blacklist

violations := blacklist.get_violations(
    vars.variables,
    ["backup_config", 0, "permissive_mode"],
    [true]
)

message := [m | 
    some violation in violations
    m := violation.message
]