package terraform.gcp.security.compute_engine.google_compute_instance_template.resource_manager_tags

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template has a Resource Manager tag key that is not a permanent tag key ID (tagKeys/<id>). Tag-based IAM and firewall policy conditions match on these keys, so a key in any other form can leave instances outside the policy scope the tag was meant to enforce.",
            "remedies": [
                "Reference every Resource Manager tag key by its permanent ID, for example tagKeys/281474976710656.",
                "Look up the ID with gcloud resource-manager tags keys describe and use it instead of the namespaced key name."
            ]
        },
        {
            "condition": "Check that every resource_manager_tags key is a permanent tag key ID",
            "attribute_path": ["resource_manager_tags"],
            "values": ["tagKeys/*"],
            "policy_type": "map key pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
