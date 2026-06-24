package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.cleanup_policies_most_recent_versions_keep_count

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

conditions := [
    [
        {
            "situation_description": "Keep cleanup policies should retain a minimum number of recent versions to reduce the risk of deleting important rollback or recovery artifacts.",
            "remedies": [
                "Use KEEP policies with most_recent_versions.keep_count of at least 3.",
                "Increase the retained version count for critical repositories if needed."
            ]
        },
        {
            "condition": "Cleanup policy action is KEEP",
            "attribute_path": ["cleanup_policies", 1, "action"],
            "values": ["KEEP"],
            "policy_type": "whitelist"
        },
        {
            "condition": "Keep policy must retain at least 3 recent versions",
            "attribute_path": ["cleanup_policies", 1, "most_recent_versions", 0, "keep_count"],
            "values": [3, 100],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
