package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_baseline_values_name_constraints_critical

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool baseline name constraints must be marked critical so clients cannot silently ignore them.",
            "remedies": [
                "Set issuance_policy.baseline_values.name_constraints.critical to true.",
                "Review the intended name constraints before issuing certificates."
            ]
        },
        {
            "condition": "name constraints must be critical",
            "attribute_path": ["issuance_policy", 0, "baseline_values", 0, "name_constraints", 0, "critical"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details