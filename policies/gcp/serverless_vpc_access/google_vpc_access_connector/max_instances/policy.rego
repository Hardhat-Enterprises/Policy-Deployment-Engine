package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.max_instances

import data.terraform.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    [
        {
            "situation_description": "Serverless VPC Access Connector max instances is outside the allowed range",
            "remedies": ["Set max_instances to a value between 3 and 10"]
        },
        {
            "condition": "The max instances must be between 3 and 10",
            "attribute_path": ["max_instances"],
            "values": [3, 10],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details