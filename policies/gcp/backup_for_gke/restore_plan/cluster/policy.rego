package terraform.gcp.security.backup_for_gke.restore_plan.cluster

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars
import data.terraform.helpers.policies.pattern_whitelist

# Ensure restore targets approved clusters only
violations := pattern_whitelist.get_violations(
    vars.variables,
    ["restore_config", 0, "cluster"],
    ["projects/*/locations/australia-southeast*/clusters/*", [[], [], []]]
)

message := [m | 
    some violation in violations
    m := violation.message
]