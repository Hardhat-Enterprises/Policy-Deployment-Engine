package terraform.gcp.security.backup_for_gke.restore_plan.transformation_rules

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars
import data.terraform.helpers.policies.whitelist

# Must have transformation rules defined
violations := whitelist.get_violations(
    vars.variables,
    ["restore_config", 0, "transformation_rules", 0, "field_actions"],
    [["REMOVE"], ["REPLACE"]]
)

message := [m | 
    some violation in violations
    m := violation.message
]