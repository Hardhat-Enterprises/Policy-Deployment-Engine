package terraform.gcp.security.apigee.google_apigee_nat_address.activate

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_nat_address.vars

conditions := [
    [
        {
            "situation_description": "Apigee NAT Address is not activated which means the static external IP address is reserved but not in use for Internet egress traffic",
            "remedies": [
                "Set activate to true to enable the NAT address for Internet egress traffic",
                "An inactive NAT address wastes reserved IP resources and does not provide egress traffic control"
            ]
        },
        {
            "condition": "Check if activate is set to true",
            "attribute_path": ["activate"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
