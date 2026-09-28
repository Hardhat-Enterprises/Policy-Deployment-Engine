package terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.network_match_src_region_codes

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy_rule.vars

conditions := [
    [
        {
            "situation_description": "The regional security policy rule permits source geographic regions outside the organisation's approved traffic boundary.",
            "remedies": [
                "Restrict source region codes to explicitly approved ISO 3166-1 alpha-2 country codes.",
                "Allow additional source regions only where there is a documented business and security requirement.",
                "Periodically review geographic access requirements and remove regions that are no longer required."
            ]
        },
        {
            "condition": "Require source geographic matching to remain within the approved country-code baseline.",
            "attribute_path": ["network_match", 0, "src_region_codes"],
            "values": [
                "AU",
                "NZ"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
