package terraform.gcp.security.apigee.google_apigee_dns_zone.dns_zone_id

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_dns_zone.vars

conditions := [
    [
        {
            "situation_description": "dns_zone_id should be compliant",
            "remedies": [
                "Ensure dns_zone_id should is compliant"
            ]
        },
        {
            "condition": "check callback_url should is compliant",
            "attribute_path": ["dns_zone_id"],
            "values": ["my-dns-zone-id"],

            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
