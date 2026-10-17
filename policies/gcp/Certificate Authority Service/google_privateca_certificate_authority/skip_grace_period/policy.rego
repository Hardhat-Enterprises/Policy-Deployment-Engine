package terraform.gcp.security.certificate_authority_service.google_privateca_certificate_authority.skip_grace_period

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate_authority.vars

conditions := [
    [
        {
            "situation_description": "Certificate Authority deletion must retain the recovery grace period to prevent immediate irreversible removal.",
            "remedies": [
                "Set skip_grace_period to false.",
                "Keep the 30-day grace period so an accidentally deleted Certificate Authority can be recovered."
            ]
        },
        {
            "condition": "deletion grace period is not skipped",
            "attribute_path": ["skip_grace_period"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
