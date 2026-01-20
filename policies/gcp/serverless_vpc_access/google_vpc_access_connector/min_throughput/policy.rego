package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.min_throughput

import data.terraform.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    [
        {
            "situation_description": "Serverless VPC Access Connector min throughput is outside the allowed range",
            "remedies": ["Set min_throughput to a value between 300 and 1000"]
        },
        {
            "condition": "The min throughput must be between 300 and 1000",
            "attribute_path": ["min_throughput"],
            "values": [300, 1000],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details