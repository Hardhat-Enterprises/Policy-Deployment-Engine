package terraform.gcp.security.backup_for_gke.restore_plan.namespaced_resource_restore_mode

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars
import data.terraform.helpers.policies.whitelist

violations := whitelist.get_violations(
    vars.variables,
    ["restore_config", 0, "namespaced_resource_restore_mode"],
    ["DELETE_AND_RESTORE", "FAIL_ON_CONFLICT"]
)

message := [m | 
    some violation in violations
    m := violation.message
]