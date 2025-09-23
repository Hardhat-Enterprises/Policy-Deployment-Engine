package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.ip_cidr_range_compliance

import data.terraform.gcp.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    {
        "situation_description": "VPC Access Connector must use approved private IP ranges",
        "remedies": ["Use RFC 1918 private IP ranges with /28 subnet"],
    },
    {
        "condition": "Checking IP CIDR range",
        "attribute_path": ["ip_cidr_range"],
        "values": ["*.*.*.*/28", [["10", "172", "192"]]],
        "policy_type": "pattern whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details