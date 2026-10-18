package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.cleanup_policy_dry_run

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
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details
