package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.maven_snapshot_overwrite_disallowed

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

conditions := [
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

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details