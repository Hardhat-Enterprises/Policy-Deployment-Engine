package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.cleanup_policies_condition_tag_state

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

conditions := [
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
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
