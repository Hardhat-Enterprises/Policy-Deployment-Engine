package terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_issuance_config.rotation_window_percentage

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_certificate_issuance_config.vars as vars

conditions := [
    [
        {
            "situation_description": "When a certificate issuance config uses a non-approved rotation window percentage, certificate renewal timing may not align with the organisation's certificate lifecycle standard.",
            "remedies": [
                "Use the approved rotation window percentage for certificate issuance configuration."
            ]
        },
        {
            "condition": "Certificate issuance configs should use the approved rotation window percentage.",
            "attribute_path": ["rotation_window_percentage"],
            "values": [34],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
