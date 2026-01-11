package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.network

import rego.v1
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars
import data.terraform.helpers.policies.whitelist

violations := whitelist.get_violations(
    vars.variables,
    ["network"],
    ["default", "production-vpc"]
)

message := [m | 
    some violation in violations
    m := violation.message
]