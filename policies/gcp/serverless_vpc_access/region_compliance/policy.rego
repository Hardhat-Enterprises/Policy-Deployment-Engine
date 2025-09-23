package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.region_compliance

import data.terraform.gcp.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    {
        "situation_description": "Serverless VPC Access Connector must be deployed in approved Australian regions for data sovereignty",
        "remedies": ["Set region to australia-southeast1 or australia-southeast2"],
    },
    {
        "condition": "Checking region compliance",
        "attribute_path": ["region"],
        "values": ["australia-southeast1", "australia-southeast2"],
        "policy_type": "whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details