package terraform.gcp.security.backup_for_gke.restore_channel.name

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_channel.vars
import data.terraform.helpers.policies.pattern_whitelist

# Name must follow naming convention
violations := pattern_whitelist.get_violations(
    vars.variables,
    ["name"],
    ["gke-restore-channel-*", [[]]]
)

message := [m | 
    some violation in violations
    m := violation.message
]