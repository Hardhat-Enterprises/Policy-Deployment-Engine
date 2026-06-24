package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.network

import data.terraform.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    [
        {
            "situation_description": "Serverless VPC Access Connector network is not in the approved list",
            "remedies": ["Set network to one of the approved values: default, production-vpc"]
        },
        {
            "condition": "The network must be one of the approved values",
            "attribute_path": ["network"],
            "values": ["default", "production-vpc"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Serverless VPC Access Connector network must not be a test or dev network",
            "remedies": ["Change network to a production network, avoiding names strictly matching 'test' or 'dev' patterns"]
        },
        {
            "condition": "The network must not be a test or dev network",
            "attribute_path": ["network"],
            "values": ["^test-.*", "^dev-.*"],
            "policy_type": "pattern blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details