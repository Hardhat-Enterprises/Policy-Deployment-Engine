package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.subnet

import rego.v1
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars
import data.terraform.helpers.policies.whitelist

violations := whitelist.get_violations(
    vars.variables,
    ["subnet", 0, "name"],
    ["approved-subnet", "production-subnet"]
)

message := [m | 
    some violation in violations
    m := violation.message
]