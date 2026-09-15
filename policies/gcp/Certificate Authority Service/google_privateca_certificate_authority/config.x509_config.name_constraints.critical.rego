package terraform.gcp.security.certificate_authority_service.google_privateca_certificate_authority.config_x509_config_name_constraints_critical

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate_authority.vars

conditions := [
    [
        {
            "situation_description": "Certificate Authority X.509 name constraints must be marked critical so unsupported constraints fail closed.",
            "remedies": [
                "Set config.x509_config.name_constraints.critical to true.",
                "Mark name constraints critical so clients that cannot process them reject the certificate."
            ]
        },
        {
            "condition": "X.509 name constraints are marked critical",
            "attribute_path": ["config", 0, "x509_config", 0, "name_constraints", 0, "critical"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
