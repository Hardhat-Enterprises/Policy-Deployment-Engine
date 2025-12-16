package terraform.gcp.security.backup_for_gke.backup_plan.include_secrets

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars
import data.terraform.helpers.policies.blacklist

# Secrets should not be included in backups
violations := blacklist.get_violations(
    vars.variables,
    ["backup_config", 0, "include_secrets"],
    [true]
)

message := [m | 
    some violation in violations
    m := violation.message
]