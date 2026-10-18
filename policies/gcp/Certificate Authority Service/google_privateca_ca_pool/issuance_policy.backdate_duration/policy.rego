package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_backdate_duration

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool certificates must not be automatically backdated.",
            "remedies": [
                "Leave issuance_policy.backdate_duration unset or set it to 0s.",
                "Only enable certificate backdating when an approved issuance requirement calls for it."
            ]
        },
        {
            "condition": "backdate duration must be unset or zero",
            "attribute_path": ["issuance_policy", 0, "backdate_duration"],
            "values": [null, "0s"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details