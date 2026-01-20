package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.region

import data.terraform.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    [
        {
            "situation_description": "Serverless VPC Access Connector region is not in the approved list",
            "remedies": ["Set region to one of the approved values: australia-southeast1, australia-southeast2"]
        },
        {
            "condition": "The region must be one of the approved values",
            "attribute_path": ["region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details