package terraform.gcp.security.apigee.google_apigee_dns_zone.domain

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_dns_zone.vars

conditions := [
    [
        {
            "situation_description": "domain should be compliant",
            "remedies": [
                "Ensure domain should is compliant"
            ]
        },
        {
            "condition": "check domain should is compliant",
            "attribute_path": ["domain"],
            "values": ["hardhat.deakin.edu.au"],

            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
