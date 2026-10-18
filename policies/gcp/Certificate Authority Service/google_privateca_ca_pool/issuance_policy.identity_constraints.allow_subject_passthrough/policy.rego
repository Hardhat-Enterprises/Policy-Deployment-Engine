package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_identity_constraints_allow_subject_passthrough

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool certificate subjects must not be copied directly from certificate requests.",
            "remedies": [
                "Set issuance_policy.identity_constraints.allow_subject_passthrough to false.",
                "Use an approved process to control the subject in issued certificates."
            ]
        },
        {
            "condition": "requestor-supplied subjects must not pass through",
            "attribute_path": ["issuance_policy", 0, "identity_constraints", 0, "allow_subject_passthrough"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details