package terraform.gcp.security.compute_engine.google_compute_instance_template.resource_manager_tags

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template sets no Resource Manager tags. Tag-based IAM deny policies and network firewall policies match on these tags, so instances created from an untagged template fall outside every such condition and silently miss those controls.",
            "remedies": [
                "Add at least one Resource Manager tag to resource_manager_tags, keyed by its permanent tag key ID, for example { \"tagKeys/281474976710656\" = \"tagValues/281474976710657\" }.",
                "Choose the tag that your organisation's tag-based IAM and firewall policies use for this workload's environment or data classification."
            ]
        },
        {
            "condition": "Check that resource_manager_tags is set and not empty",
            "attribute_path": ["resource_manager_tags"],
            "values": [null, {}],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "The instance template has a Resource Manager tag key that is not a permanent tag key ID (tagKeys/<id>), so it does not reliably identify the tag that IAM and firewall policy conditions match on.",
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
