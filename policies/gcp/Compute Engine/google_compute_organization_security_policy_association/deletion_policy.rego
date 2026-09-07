package terraform.gcp.security.compute_engine.google_compute_organization_security_policy_association.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_organization_security_policy_association.vars

conditions := [
    [
        {
            "situation_description": "Organization Security Policy Association can be destroyed, risking accidental loss of security policy enforcement",
            "remedies": [
                "Set deletion_policy to PREVENT to block destructive removal of the association"
            ]
        },
        {
            "condition": "Deletion policy must prevent destructive removal of the security policy association",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details