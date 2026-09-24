package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_issuance_config.lifetime

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_issuance_config.vars as vars

conditions := [
    [
        {
            "situation_description": "When a certificate issuance config uses a non-approved certificate lifetime, certificates may remain valid for longer than the organisation's intended security standard.",
            "remedies": [
                "Use the approved certificate lifetime for certificate issuance configuration."
            ]
        },
        {
            "condition": "Certificate issuance configs should use the approved certificate lifetime.",
            "attribute_path": ["lifetime"],
            "values": ["1814400s"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
