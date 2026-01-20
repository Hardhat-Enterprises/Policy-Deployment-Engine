package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.machine_type

import data.terraform.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    [
        {
            "situation_description": "Serverless VPC Access Connector machine type is not in the approved list",
            "remedies": ["Set machine_type to one of the approved values: e2-micro, e2-standard-4, f1-micro"]
        },
        {
            "condition": "The machine type must be one of the approved values",
            "attribute_path": ["machine_type"],
            "values": ["e2-micro", "e2-standard-4", "f1-micro"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details