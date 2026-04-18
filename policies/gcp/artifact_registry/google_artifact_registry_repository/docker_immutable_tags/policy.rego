package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.docker_immutable_tags

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

conditions := [
    [
        {
            "situation_description": "Docker repositories should enable immutable tags to prevent tags from being modified, moved, or deleted after publication.",
            "remedies": [
                "Set docker_config.immutable_tags to true for Docker repositories."
            ]
        },
        {
            "condition": "Repository format is DOCKER",
            "attribute_path": ["format"],
            "values": ["DOCKER"],
            "policy_type": "whitelist"
        },
        {
            "condition": "docker_config.immutable_tags must be enabled",
            "attribute_path": ["docker_config", 0, "immutable_tags"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details