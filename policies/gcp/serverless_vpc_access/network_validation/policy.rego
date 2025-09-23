package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.network_validation

import data.terraform.gcp.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    {
        "situation_description": "VPC Access Connector must be attached to approved production networks",
        "remedies": ["Attach connector to approved production VPC network"],
    },
    {
        "condition": "Checking network configuration",
        "attribute_path": ["network"],
        "values": ["projects/*/global/networks/*", [["prod-vpc", "production-network", "secure-vpc"]]],
        "policy_type": "pattern whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details