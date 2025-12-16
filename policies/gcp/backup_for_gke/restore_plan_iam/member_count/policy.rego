package terraform.gcp.security.backup_for_gke.restore_plan_iam.member_count

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam.vars
import data.terraform.helpers.policies.range

# Limit number of members (between 1 and 10)
violations := range.get_violations(
    vars.variables,
    ["members_count"],
    [1, 10]
)

message := [m | 
    some violation in violations
    m := violation.message
]