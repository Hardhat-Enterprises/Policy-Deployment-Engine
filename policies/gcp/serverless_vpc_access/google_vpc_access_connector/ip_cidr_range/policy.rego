package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.ip_cidr_range

import data.terraform.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    [
        {
            "situation_description": "Serverless VPC Access Connector IP CIDR range is not in the approved list",
            "remedies": ["Set ip_cidr_range to one of the approved values: 10.8.0.0/28, 10.9.0.0/28, 10.10.0.0/28"]
        },
        {
            "condition": "The IP CIDR range must be one of the approved values",
            "attribute_path": ["ip_cidr_range"],
            "values": ["10.8.0.0/28", "10.9.0.0/28", "10.10.0.0/28"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Serverless VPC Access Connector IP CIDR range must not be 0.0.0.0/0",
            "remedies": ["Change ip_cidr_range to a valid private range, not 0.0.0.0/0"]
        },
        {
            "condition": "The IP CIDR range must not be 0.0.0.0/0",
            "attribute_path": ["ip_cidr_range"],
            "values": ["0.0.0.0/0"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details