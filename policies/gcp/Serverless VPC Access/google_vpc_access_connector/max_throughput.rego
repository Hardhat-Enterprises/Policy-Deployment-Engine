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
    ],
    [
        {
            "situation_description": "Serverless VPC Access Connector max throughput exceeds cost limits",
            "remedies": ["Ensure max_throughput is less than or equal to 900 to align with cost tiers"]
        },
        {
            "condition": "The max throughput must be less than or equal to 900",
            "attribute_path": ["max_throughput"],
            "values": [0, 900],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details