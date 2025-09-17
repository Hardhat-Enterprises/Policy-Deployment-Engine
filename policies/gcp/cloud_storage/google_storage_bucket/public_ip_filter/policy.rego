package terraform.gcp.security.cloud_storage.google_storage_bucket.public_ip_filter

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket.vars

conditions := [
    [
        {
            "situation_description": "IP filtering is too broad.",
            "remedies": ["Need to narrow the IP filtering. 0.0.0.0/0 is too boad"]
        },
        {
            "condition": "Check if all ips are allowed.",
            "attribute_path": ["ip_filter",0,"public_network_source",0,"allowed_ip_cidr_ranges",0],
            "values": ["0.0.0.0/0"],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
