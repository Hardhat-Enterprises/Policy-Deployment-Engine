package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.tier

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pool must use the ENTERPRISE tier to enforce admin approval controls and audit logging for all certificate operations.",
            "remedies": [
                "Set tier to 'ENTERPRISE'.",
                "The DEVOPS tier lacks HSM-backed keys and granular audit logging required by organisational policy."
            ]
        },
        {
            "condition": "tier is in approved tier whitelist",
            "attribute_path": ["tier"],
            "values": ["ENTERPRISE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
