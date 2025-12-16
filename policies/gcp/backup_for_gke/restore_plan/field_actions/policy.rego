package terraform.gcp.security.backup_for_gke.restore_plan.field_actions

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars
import data.terraform.helpers.policies.whitelist

# Only allow safe field actions
violations := whitelist.get_violations(
    vars.variables,
    ["restore_config", 0, "transformation_rules", 0, "field_actions", 0, "op"],
    ["REMOVE", "REPLACE", "ADD"]
)

message := [m | 
    some violation in violations
    m := violation.message
]