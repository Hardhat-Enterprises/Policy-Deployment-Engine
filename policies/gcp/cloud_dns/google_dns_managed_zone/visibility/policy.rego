package terraform.gcp.security.cloud_dns.google_dns_managed_zone.visibility

import data.terraform.helpers
import data.terraform.gcp.security.cloud_dns.google_dns_managed_zone.vars

conditions := [
    [
        {
            "situation_description": "The DNS managed zone visibility is not in the allowed list. Public zones expose DNS records to the entire internet.",
            "remedies": [
                "Set visibility to 'private' to restrict zone access to authorised VPC networks only.",
                "Add a private_visibility_config block listing the approved VPC networks.",
                "Consult Google Cloud DNS documentation on zone visibility settings."
            ]
        },
        {
            "condition": "Check if visibility is not in the allowed whitelist",
            "attribute_path": ["visibility"],
            "values": ["private"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details