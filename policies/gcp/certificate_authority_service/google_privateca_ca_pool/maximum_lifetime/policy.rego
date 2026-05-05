package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.maximum_lifetime

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool maximum certificate lifetime must not exceed 87600h (10 years) to limit exposure from long-lived certificates.",
            "remedies": [
                "Set issuance_policy.maximum_lifetime to a value no greater than '315360000s' (87600h / 10 years).",
                "Shorter lifetimes reduce the window of exposure if a certificate is compromised."
            ]
        },
        {
            "condition": "maximum_lifetime is within approved range",
            "attribute_path": ["issuance_policy", 0, "maximum_lifetime"],
            "values": [1, 315360000],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
