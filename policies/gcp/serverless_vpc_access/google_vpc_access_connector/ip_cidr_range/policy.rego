package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.ip_cidr_range

import rego.v1
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars
import data.terraform.helpers.policies.whitelist

violations := whitelist.get_violations(
    vars.variables,
    ["ip_cidr_range"],
    ["10.8.0.0/28", "10.9.0.0/28", "10.10.0.0/28"]
)

message := [m | 
    some violation in violations
    m := violation.message
]