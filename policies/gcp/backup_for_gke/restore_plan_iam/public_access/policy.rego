package terraform.gcp.security.backup_for_gke.restore_plan_iam.public_access

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam.vars
import data.terraform.helpers.policies.element_blacklist

# Prevent public access
violations := element_blacklist.get_violations(
    vars.variables,
    ["members"],
    ["allUsers", "allAuthenticatedUsers"]
)

message := [m | 
    some violation in violations
    m := violation.message
]