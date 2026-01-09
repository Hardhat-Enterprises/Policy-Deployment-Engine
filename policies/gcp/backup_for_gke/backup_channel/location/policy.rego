package terraform.gcp.security.backup_for_gke.backup_channel.location

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_channel.vars
import data.terraform.helpers.policies.whitelist

violations := whitelist.get_violations(
    vars.variables,
    ["location"],
    ["australia-southeast1", "australia-southeast2"]
)

message := [m | 
    some violation in violations
    m := violation.message
]