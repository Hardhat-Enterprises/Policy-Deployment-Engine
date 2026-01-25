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
    ],
    [
        {
            "situation_description": "Serverless VPC Access Connector region must not be a legacy or high-cost region",
            "remedies": ["Change region to a supported production region, us-old-region is deprecated"]
        },
        {
            "condition": "The region must not be a legacy or high-cost region",
            "attribute_path": ["region"],
            "values": ["us-old-region", "europe-old-region"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details