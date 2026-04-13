package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.approved_remote_upstreams

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

conditions := [
    [
        {
            "situation_description": "Remote repositories should use only approved upstream sources to reduce supply-chain and trust risks.",
            "remedies": [
                "Use only approved upstream Artifact Registry repositories or approved external registry URIs.",
                "Update the remote upstream URI to an allowed value."
            ]
        },
        {
            "condition": "Repository mode is REMOTE_REPOSITORY",
            "attribute_path": ["mode"],
            "values": ["REMOTE_REPOSITORY"],
            "policy_type": "whitelist"
        },
        {
            "condition": "Remote upstream URI must follow an approved pattern",
            "attribute_path": ["remote_repository_config", 0, "common_repository", 0, "uri"],
            "values": [
                "https://*-docker.pkg.dev/*/*",
                [
                    ["us-central1", "australia-southeast1"],
                    ["trusted-project", "shared-artifacts"],
                    ["base-images", "approved-upstream"]
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details