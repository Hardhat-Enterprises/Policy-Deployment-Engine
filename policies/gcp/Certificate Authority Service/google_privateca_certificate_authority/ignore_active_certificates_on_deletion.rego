package terraform.gcp.security.certificate_authority_service.google_privateca_certificate_authority.ignore_active_certificates_on_deletion

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate_authority.vars

conditions := [
    [
        {
            "situation_description": "Certificate Authority deletion must not bypass the safeguard for active certificates.",
            "remedies": [
                "Set ignore_active_certificates_on_deletion to false.",
                "Revoke or allow active certificates to expire before deleting the Certificate Authority."
            ]
        },
        {
            "condition": "active certificates are not ignored during deletion",
            "attribute_path": ["ignore_active_certificates_on_deletion"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
