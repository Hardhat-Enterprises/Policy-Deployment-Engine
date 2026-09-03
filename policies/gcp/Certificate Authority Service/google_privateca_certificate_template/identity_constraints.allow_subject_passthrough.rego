package terraform.gcp.security.certificate_authority_service.google_privateca_certificate_template.identity_constraints_allow_subject_passthrough

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_certificate_template.vars

conditions := [
    [
        {
            "situation_description": "Certificate templates must not allow unrestricted subject passthrough from certificate requests.",
            "remedies": [
                "Set identity_constraints.allow_subject_passthrough to false.",
                "Disabling subject passthrough prevents requesters from inserting unauthorized subject identities into issued certificates."
            ]
        },
        {
            "condition": "subject passthrough must not be enabled",
            "attribute_path": ["identity_constraints", 0, "allow_subject_passthrough"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details