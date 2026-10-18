package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_identity_constraints_allow_subject_alt_names_passthrough

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool certificates must not copy Subject Alternative Names directly from certificate requests.",
            "remedies": [
                "Set issuance_policy.identity_constraints.allow_subject_alt_names_passthrough to false.",
                "Use an approved process to control identities in issued certificates."
            ]
        },
        {
            "condition": "requestor-supplied Subject Alternative Names must not pass through",
            "attribute_path": ["issuance_policy", 0, "identity_constraints", 0, "allow_subject_alt_names_passthrough"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details