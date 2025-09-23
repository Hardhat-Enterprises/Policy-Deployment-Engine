package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.min_instances_requirement

import data.terraform.gcp.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    {
        "situation_description": "Minimum instances for high availability",
        "remedies": ["Set min_instances to at least 2 for high availability"],
    },
    {
        "condition": "Checking minimum instances",
        "attribute_path": ["min_instances"],
        "values": [2, null],
        "policy_type": "range"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details