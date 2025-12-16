package terraform.gcp.security.backup_for_gke.restore_plan.volume_data_restore

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars
import data.terraform.helpers.policies.whitelist

# Only allow safe volume restoration policies
violations := whitelist.get_violations(
    vars.variables,
    ["restore_config", 0, "volume_data_restore_policy"],
    ["RESTORE_VOLUME_DATA_FROM_BACKUP", "NO_VOLUME_DATA_RESTORATION"]
)

message := [m | 
    some violation in violations
    m := violation.message
]