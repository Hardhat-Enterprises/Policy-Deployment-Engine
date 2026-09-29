package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pools must be protected against accidental deletion to preserve certificate issuance services and the PKI trust infrastructure.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Review and approve any intentional deletion of the CA Pool."
            ]
        },
        {
            "condition": "CA Pool deletion policy is set to PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details