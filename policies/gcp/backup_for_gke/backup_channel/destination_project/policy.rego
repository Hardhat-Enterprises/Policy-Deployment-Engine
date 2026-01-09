package terraform.gcp.security.backup_for_gke.backup_channel.destination_project

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_channel.vars
import data.terraform.helpers.policies.pattern_whitelist

violations := pattern_whitelist.get_violations(
    vars.variables,
    ["destination_project"],
    ["projects/*/locations/australia-southeast1", [[], []]]
)

message := [m | 
    some violation in violations
    m := violation.message
]