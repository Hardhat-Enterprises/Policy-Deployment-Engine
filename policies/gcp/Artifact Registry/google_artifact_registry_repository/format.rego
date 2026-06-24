package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.format

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

# Merged policy for `format` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
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
    ],
[
        {
            "situation_description": "Maven repositories should not allow snapshot overwrites because re-publishing the same snapshot can weaken artifact integrity and make builds less reproducible.",
            "remedies": [
                "Set maven_config.allow_snapshot_overwrites to false.",
                "Use immutable publishing practices for Maven snapshot artifacts."
            ]
        },
        {
            "condition": "Repository format is MAVEN",
            "attribute_path": ["format"],
            "values": ["MAVEN"],
            "policy_type": "whitelist"
        },
        {
            "condition": "Maven snapshot overwrites must not be enabled",
            "attribute_path": ["maven_config", 0, "allow_snapshot_overwrites"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
