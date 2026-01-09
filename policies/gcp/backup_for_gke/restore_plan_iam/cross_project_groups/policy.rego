package terraform.gcp.security.backup_for_gke.restore_plan_iam.cross_project_groups

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan_iam.vars
import data.terraform.helpers.policies.element_blacklist

violations := element_blacklist.get_violations(
    vars.variables,
    ["members"],
    ["group:*@ext-", "group:*@external-", "group:*@partner-"]
)

message := [m | 
    some violation in violations
    m := violation.message
]