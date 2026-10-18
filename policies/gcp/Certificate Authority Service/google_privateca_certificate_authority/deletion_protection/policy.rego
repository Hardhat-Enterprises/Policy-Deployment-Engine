package terraform.gcp.security.certificate_authority_service.google_privateca_certificate_authority.deletion_protection

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate_authority.vars

conditions := [
    [
        {
            "situation_description": "Certificate Authority deletion protection must be enabled to prevent accidental or unauthorised deletion of the CA.",
            "remedies": [
                "Set deletion_protection to true.",
                "Deletion protection prevents accidental destruction of a CA which would invalidate all certificates it has issued."
            ]
        },
        {
            "condition": "deletion_protection is in approved whitelist",
            "attribute_path": ["deletion_protection"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
