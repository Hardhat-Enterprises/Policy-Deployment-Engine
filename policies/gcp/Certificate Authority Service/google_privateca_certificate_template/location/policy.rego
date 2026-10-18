package terraform.gcp.security.certificate_authority_service.google_privateca_certificate_template.location

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate_template.vars

conditions := [
    [
        {
            "situation_description": "Certificate template must be created in an approved geographic region.",
            "remedies": [
                "Set location to an approved region such as australia-southeast1 or australia-southeast2.",
                "Use an approved region to meet organisational data-residency requirements."
            ]
        },
        {
            "condition": "location is in approved region whitelist",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details