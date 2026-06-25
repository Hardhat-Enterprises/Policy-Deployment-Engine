package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.issuance_policy_maximum_lifetime

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool maximum certificate lifetime must not be set to an excessively long duration. '999999999s' (~31.7 years) far exceeds the recommended maximum of '315360000s' (10 years) and unnecessarily extends exposure if a certificate is compromised.",
            "remedies": [
                "Set issuance_policy.maximum_lifetime to a value no greater than '315360000s' (87600h / 10 years).",
                "Shorter lifetimes reduce the window of exposure if a certificate or its issuing CA is compromised."
            ]
        },
        {
            "condition": "maximum_lifetime is not set to a prohibited excessive value",
            "attribute_path": ["issuance_policy", 0, "maximum_lifetime"],
            "values": ["999999999s"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
