package terraform.gcp.security.certificate_authority_service.google_privateca_certificate_template.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate_template.vars

conditions := [
    [
        {
            "situation_description": "Certificate template deletion policy must prevent Terraform from destroying the template.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Using PREVENT protects certificate issuance requirements from accidental Terraform destruction."
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