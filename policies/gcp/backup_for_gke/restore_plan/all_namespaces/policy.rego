package terraform.gcp.security.backup_for_gke.restore_plan.all_namespaces

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars
import data.terraform.helpers.policies.blacklist

# Blacklist all_namespaces=true (violates least privilege)
violations := blacklist.get_violations(
    vars.variables,
    ["restore_config", 0, "all_namespaces"],
    [true]
)

message := [m | 
    some violation in violations
    m := violation.message
]