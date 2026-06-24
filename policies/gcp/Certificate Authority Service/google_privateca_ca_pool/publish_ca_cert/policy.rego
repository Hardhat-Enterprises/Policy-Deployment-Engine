package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.publish_ca_cert

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool must publish CA certificates to allow clients to establish trust with the CA hierarchy.",
            "remedies": [
                "Set publishing_options.publish_ca_cert to true.",
                "Publishing CA certificates is required for clients to validate the chain of trust."
            ]
        },
        {
            "condition": "publish_ca_cert is in approved whitelist",
            "attribute_path": ["publishing_options", 0, "publish_ca_cert"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
