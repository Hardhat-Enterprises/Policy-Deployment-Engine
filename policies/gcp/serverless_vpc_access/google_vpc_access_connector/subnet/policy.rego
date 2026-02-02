package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.subnet

import data.terraform.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    [
        {
            "situation_description": "Serverless VPC Access Connector subnet name is not in the approved list",
            "remedies": ["Set subnet name to one of the approved values: approved-subnet, production-subnet"]
        },
        {
            "condition": "The subnet name must be one of the approved values",
            "attribute_path": ["subnet", 0, "name"],
            "values": ["approved-subnet", "production-subnet"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Serverless VPC Access Connector subnet name must differ from default patterns",
            "remedies": ["Ensure subnet name follows the naming convention starting with 'subnet-'"]
        },
        {
            "condition": "The subnet name must start with 'subnet-'",
            "attribute_path": ["subnet", 0, "name"],
            "values": ["^subnet-.*"],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details