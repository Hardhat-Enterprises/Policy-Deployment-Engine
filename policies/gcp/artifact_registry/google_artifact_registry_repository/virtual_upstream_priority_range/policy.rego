package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.virtual_upstream_priority_range

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

conditions := [
    [
        {
            "situation_description": "Virtual repositories should assign upstream priorities within an approved range to keep upstream resolution predictable and controlled.",
            "remedies": [
                "Set upstream priority to an approved numeric range.",
                "Review virtual_repository_config.upstream_policies.priority."
            ]
        },
        {
            "condition": "Repository mode is VIRTUAL_REPOSITORY",
            "attribute_path": ["mode"],
            "values": ["VIRTUAL_REPOSITORY"],
            "policy_type": "whitelist"
        },
        {
            "condition": "Upstream priority must be between 1 and 100",
            "attribute_path": ["virtual_repository_config", 0, "upstream_policies", 0, "priority"],
            "values": [1, 100],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details