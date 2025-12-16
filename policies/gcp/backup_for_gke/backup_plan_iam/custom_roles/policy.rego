package terraform.gcp.security.backup_for_gke.backup_plan_iam.custom_roles

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam.vars
import data.terraform.helpers.policies.blacklist

# Prevent use of custom roles (harder to audit)
violations := blacklist.get_violations(
    vars.variables,
    ["role"],
    ["organizations/*/roles/*", "projects/*/roles/*"]
)

message := [m | 
    some violation in violations
    m := violation.message
]