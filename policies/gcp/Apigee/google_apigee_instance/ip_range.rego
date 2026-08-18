package terraform.gcp.security.apigee.google_apigee_instance.ip_range

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_instance.vars

conditions := [
    [
        {
            "situation_description": "Apigee Instance ip_range does not use the required /22 CIDR block size",
            "remedies": [
                "Set ip_range to a valid /22 CIDR block",
                "Example: 10.87.8.0/22",
                "The range must be freely available within the Service Networking peering range"
            ]
        },
        {
            "condition": "Check if ip_range uses /22 prefix length",
            "attribute_path": ["ip_range"],
            "values": [
                "*/*",
                [[], ["16", "17", "18", "19", "20", "21", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "8"]]
            ],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
