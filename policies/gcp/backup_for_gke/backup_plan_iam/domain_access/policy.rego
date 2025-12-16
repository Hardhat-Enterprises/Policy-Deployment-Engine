package terraform.gcp.security.backup_for_gke.backup_plan_iam.domain_access

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam.vars
import data.terraform.helpers.policies.element_blacklist

# Block personal email domains
violations := element_blacklist.get_violations(
    vars.variables,
    ["members"],
    ["@gmail.com", "@hotmail.com", "@yahoo.com", "@outlook.com"]
)

message := [m | 
    some violation in violations
    m := violation.message
]