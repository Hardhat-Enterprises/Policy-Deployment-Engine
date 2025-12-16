package terraform.gcp.security.backup_for_gke.backup_plan.all_namespaces

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars
import data.terraform.helpers.policies.blacklist

# Blacklist all_namespaces=true (violates least privilege)
violations := blacklist.get_violations(
    vars.variables,
    ["backup_config", 0, "all_namespaces"],
    [true]
)

message := [m | 
    some violation in violations
    m := violation.message
]