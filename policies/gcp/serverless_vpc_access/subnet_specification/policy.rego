package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.subnet_specification

import data.terraform.gcp.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    {
        "situation_description": "Subnet must be properly specified when provided",
        "remedies": ["Use approved production subnet"],
    },
    {
        "condition": "Checking subnet configuration",
        "attribute_path": ["subnet", 0, "name"],
        "values": ["projects/*/regions/*/subnetworks/*", [["prod", "production", "secure"]]],
        "policy_type": "pattern whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details