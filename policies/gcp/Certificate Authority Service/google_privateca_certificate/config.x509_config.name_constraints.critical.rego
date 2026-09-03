package terraform.gcp.security.certificate_authority_service.google_privateca_certificate.config_x509_config_name_constraints_critical

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate.vars

conditions := [
    [
        {
            "situation_description": "X.509 name constraints must be marked as critical so clients reject certificates when they cannot process the constraints.",
            "remedies": [
                "Set config.x509_config.name_constraints.critical to true.",
                "Marking name constraints as critical ensures that certificate scope restrictions cannot be silently ignored by clients."
            ]
        },
        {
            "condition": "name_constraints.critical is in approved whitelist",
            "attribute_path": ["config", 0, "x509_config", 0, "name_constraints", 0, "critical"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details