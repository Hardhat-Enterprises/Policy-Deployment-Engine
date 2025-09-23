package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.project_restriction

import data.terraform.gcp.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    {
        "situation_description": "VPC Access Connector must be in approved projects",
        "remedies": ["Deploy connector in production project only"],
    },
    {
        "condition": "Checking project",
        "attribute_path": ["project"],
        "values": ["*", [["prod", "production"]]],
        "policy_type": "pattern whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details