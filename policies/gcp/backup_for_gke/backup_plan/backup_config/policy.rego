package terraform.gcp.security.backup_for_gke.backup_plan.backup_config

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars
import data.terraform.helpers.policies.blacklist

# Backup config must not be empty
violations := blacklist.get_violations(
    vars.variables,
    ["backup_config"],
    [[], null]
)

message := [m | 
    some violation in violations
    m := violation.message
]