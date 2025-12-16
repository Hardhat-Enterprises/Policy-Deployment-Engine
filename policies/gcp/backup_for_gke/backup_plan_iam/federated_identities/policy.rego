package terraform.gcp.security.backup_for_gke.backup_plan_iam.federated_identities

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam.vars
import data.terraform.helpers.policies.blacklist

# Control federated identities
violations := blacklist.get_violations(
    vars.variables,
    ["members"],
    ["principal://iam.googleapis.com/*", "principalSet://iam.googleapis.com/*"]
)

message := [m | 
    some violation in violations
    m := violation.message
]