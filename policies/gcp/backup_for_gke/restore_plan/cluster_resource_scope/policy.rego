package terraform.gcp.security.backup_for_gke.restore_plan.cluster_resource_scope

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars
import data.terraform.helpers.policies.blacklist

# Prevent restoration of all cluster resources
violations := blacklist.get_violations(
    vars.variables,
    ["restore_config", 0, "cluster_resource_restore_scope", 0, "all_group_kinds"],
    [true]
)

message := [m | 
    some violation in violations
    m := violation.message
]