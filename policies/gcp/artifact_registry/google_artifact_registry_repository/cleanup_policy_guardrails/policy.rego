package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.cleanup_policy_guardrails

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

conditions := [
    [
        {
            "situation_description": "Cleanup policy dry run should be enabled so automated deletion rules can be reviewed safely before artifacts are removed.",
            "remedies": [
                "Set cleanup_policy_dry_run to true.",
                "Review cleanup policy behavior before allowing actual deletions."
            ]
        },
        {
            "condition": "Cleanup policies must run in dry-run mode",
            "attribute_path": ["cleanup_policy_dry_run"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Cleanup delete policies should not target tagged artifacts because tagged versions are usually intended to represent retained or promoted artifacts.",
            "remedies": [
                "Do not use DELETE cleanup policies for TAGGED artifacts.",
                "Restrict deletion rules to UNTAGGED or carefully scoped artifact versions."
            ]
        },
        {
            "condition": "Cleanup policy action is DELETE",
            "attribute_path": ["cleanup_policies", 0, "action"],
            "values": ["DELETE"],
            "policy_type": "whitelist"
        },
        {
            "condition": "Delete cleanup policy must not target TAGGED versions",
            "attribute_path": ["cleanup_policies", 0, "condition", 0, "tag_state"],
            "values": ["TAGGED"],
            "policy_type": "blacklist"
        }
    ],
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