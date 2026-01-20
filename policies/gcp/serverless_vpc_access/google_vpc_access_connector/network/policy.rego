package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.network

import data.terraform.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    [
        {
            "situation_description": "Serverless VPC Access Connector network is not in the approved list",
            "remedies": ["Set network to one of the approved values: default, production-vpc"]
        },
        {
            "condition": "The network must be one of the approved values",
            "attribute_path": ["network"],
            "values": ["default", "production-vpc"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details