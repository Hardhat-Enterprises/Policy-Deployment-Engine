package terraform.gcp.security.backup_for_gke.restore_channel.location

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_channel.vars
import data.terraform.helpers.policies.whitelist

# Australian data residency requirement
violations := whitelist.get_violations(
    vars.variables,
    ["location"],
    ["australia-southeast1", "australia-southeast2"]
)

message := [m | 
    some violation in violations
    m := violation.message
]