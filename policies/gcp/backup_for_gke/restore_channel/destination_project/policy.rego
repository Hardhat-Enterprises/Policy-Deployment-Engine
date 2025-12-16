package terraform.gcp.security.backup_for_gke.restore_channel.destination_project

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_channel.vars
import data.terraform.helpers.policies.pattern_whitelist

# Ensure restore channel uses approved project pattern
violations := pattern_whitelist.get_violations(
    vars.variables,
    ["destination_project"],
    ["projects/*/locations/australia-southeast1", [[], []]]
)

message := [m | 
    some violation in violations
    m := violation.message
]