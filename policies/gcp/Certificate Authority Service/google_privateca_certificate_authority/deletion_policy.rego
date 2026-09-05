package terraform.gcp.security.certificate_authority_service.google_privateca_certificate_authority.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate_authority.vars

conditions := [
    [
        {
            "situation_description": "Certificate Authority deletion must be prevented to avoid destructive removal or unmanaged abandonment.",
            "remedies": [
                "Set deletion_policy to 'PREVENT'.",
                "Do not use 'DELETE' or 'ABANDON' for Certificate Authorities that must remain protected and managed."
            ]
        },
        {
            "condition": "deletion_policy is set to prevent deletion",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
