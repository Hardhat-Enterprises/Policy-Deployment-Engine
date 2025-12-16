package terraform.gcp.security.backup_for_gke.backup_plan.labels

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars
import data.terraform.helpers.policies.whitelist

# Required labels must be present
violations := whitelist.get_violations(
    vars.variables,
    ["labels", "environment"],
    ["prod", "staging", "dev"]
)

message := [m | 
    some violation in violations
    m := violation.message
]