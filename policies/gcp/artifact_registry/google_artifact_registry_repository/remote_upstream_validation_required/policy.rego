package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.remote_upstream_validation_required

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

conditions := [
    [
        {
            "situation_description": "Remote repositories should always validate their upstream source and credentials to reduce trust and supply-chain risks.",
            "remedies": [
                "Do not set remote_repository_config.disable_upstream_validation to true.",
                "Allow upstream validation so remote source settings and credentials are checked."
            ]
        },
        {
            "condition": "Repository mode is REMOTE_REPOSITORY",
            "attribute_path": ["mode"],
            "values": ["REMOTE_REPOSITORY"],
            "policy_type": "whitelist"
        },
        {
            "condition": "disable_upstream_validation must not be true",
            "attribute_path": ["remote_repository_config", 0, "disable_upstream_validation"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details