package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.max_throughput

import data.terraform.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    [
        {
            "situation_description": "Serverless VPC Access Connector max throughput is outside the allowed range",
            "remedies": ["Set max_throughput to a value between 300 and 500"]
        },
        {
            "condition": "The max throughput must be between 300 and 500",
            "attribute_path": ["max_throughput"],
            "values": [300, 500],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details