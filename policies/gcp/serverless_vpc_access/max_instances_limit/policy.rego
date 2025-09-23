package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.max_instances_limit

import data.terraform.gcp.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    {
        "situation_description": "Maximum instances to control costs",
        "remedies": ["Set max_instances to 10 or less to control costs"],
    },
    {
        "condition": "Checking maximum instances",
        "attribute_path": ["max_instances"],
        "values": [null, 10],
        "policy_type": "range"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details