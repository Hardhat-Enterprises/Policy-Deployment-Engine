package terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.machine_type_validation

import data.terraform.gcp.helpers
import data.terraform.gcp.security.serverless_vpc_access.google_vpc_access_connector.vars

conditions := [
    {
        "situation_description": "VPC Access Connector must use approved machine types",
        "remedies": ["Use approved machine types: e2-standard-4, e2-standard-8, or e2-highmem-4"],
    },
    {
        "condition": "Checking machine type",
        "attribute_path": ["machine_type"],
        "values": ["e2-standard-4", "e2-standard-8", "e2-highmem-4"],
        "policy_type": "whitelist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details