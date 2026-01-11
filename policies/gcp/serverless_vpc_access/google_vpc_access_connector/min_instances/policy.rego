package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.min_instances

import rego.v1
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars
import data.terraform.helpers.policies.range

violations := range.get_violations(
    vars.variables,
    ["min_instances"],
    [2, 9]
)

message := [m | 
    some violation in violations
    m := violation.message
]