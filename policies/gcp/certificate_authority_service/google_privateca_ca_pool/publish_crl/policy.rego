package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.publish_crl

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool must publish certificate revocation lists to enable revocation checking by relying parties.",
            "remedies": [
                "Set publishing_options.publish_crl to true.",
                "Publishing CRLs is required to support certificate revocation and prevent use of compromised certificates."
            ]
        },
        {
            "condition": "publish_crl is in approved whitelist",
            "attribute_path": ["publishing_options", 0, "publish_crl"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
