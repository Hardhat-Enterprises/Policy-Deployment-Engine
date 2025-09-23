package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.min_throughput_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    {
        "situation_description": "Minimum throughput must meet performance requirements",
        "remedies": ["Set min_throughput to at least 200"],
    },
    {
        "condition": "Checking minimum throughput",
        "attribute_path": ["min_throughput"],
        "values": [200, null],
        "policy_type": "range"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details