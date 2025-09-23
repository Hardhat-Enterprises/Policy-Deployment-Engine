package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.max_throughput_enforcement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    {
        "situation_description": "Maximum throughput must be properly configured",
        "remedies": ["Set max_throughput between 300 and 1000"],
    },
    {
        "condition": "Checking maximum throughput",
        "attribute_path": ["max_throughput"],
        "values": [300, 1000],
        "policy_type": "range"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details