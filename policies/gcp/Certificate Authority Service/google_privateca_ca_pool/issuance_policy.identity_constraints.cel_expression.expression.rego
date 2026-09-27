package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_identity_constraints_cel_expression_expression

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool identity constraints must reject custom subject alternative name types.",
            "remedies": [
                "Set the identity constraints CEL expression to reject CUSTOM subject alternative names.",
                "Review the CEL rule before allowing new subject alternative name types."
            ]
        },
        {
            "condition": "identity CEL expression must reject custom SAN types",
            "attribute_path": ["issuance_policy", 0, "identity_constraints", 0, "cel_expression", 0, "expression"],
            "values": ["subject_alt_names.all(san, san.type != CUSTOM)"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details