package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.machine_type

import rego.v1
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars
import data.terraform.helpers.policies.whitelist

violations := whitelist.get_violations(
    vars.variables,
    ["machine_type"],
    ["e2-micro", "e2-standard-4", "f1-micro"]
)

message := [m | 
    some violation in violations
    m := violation.message
]