package terraform.gcp.security.backup_for_gke.backup_plan_iam.members

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam.vars
import data.terraform.helpers.policies.element_blacklist

# Blacklist personal email domains and public access
violations := element_blacklist.get_violations(
    vars.variables,
    ["members"],
    ["@gmail.com", "@hotmail.com", "@yahoo.com", "allUsers", "allAuthenticatedUsers"]
)

message := [m | 
    some violation in violations
    m := violation.message
]