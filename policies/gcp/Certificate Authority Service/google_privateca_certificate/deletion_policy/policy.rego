package terraform.gcp.security.certificate_authority_service.google_privateca_certificate.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate.vars

conditions := [
    [
        {
            "situation_description": "Certificate deletion policy must prevent Terraform from destroying the certificate resource.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Using PREVENT blocks accidental Terraform destruction of the managed certificate resource."
            ]
        },
        {
            "condition": "deletion_policy is in approved whitelist",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details