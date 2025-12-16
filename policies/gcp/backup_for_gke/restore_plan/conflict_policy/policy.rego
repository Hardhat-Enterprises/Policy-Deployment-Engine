package terraform.gcp.security.backup_for_gke.restore_plan.conflict_policy

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars
import data.terraform.helpers.policies.whitelist

# Only allow safe conflict resolution
violations := whitelist.get_violations(
    vars.variables,
    ["restore_config", 0, "cluster_resource_conflict_policy"],
    ["USE_EXISTING_VERSION"]
)

message := [m | 
    some violation in violations
    m := violation.message
]