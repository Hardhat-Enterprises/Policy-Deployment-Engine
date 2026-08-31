package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.min_instances

import data.terraform.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    [
        {
            "situation_description": "Serverless VPC Access Connector min instances is outside the allowed range",
            "remedies": ["Set min_instances to a value between 2 and 9"]
        },
        {
            "condition": "The min instances must be between 2 and 9",
            "attribute_path": ["min_instances"],
            "values": [2, 9],
            "policy_type": "range"
        }
    ],
    [
        {
            "situation_description": "Serverless VPC Access Connector min instances is too high causing potential resource wastage",
            "remedies": ["Reduce min_instances to a value less than 10"]
        },
        {
            "condition": "The min instances must be less than 10",
            "attribute_path": ["min_instances"],
            "values": [0, 9],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details