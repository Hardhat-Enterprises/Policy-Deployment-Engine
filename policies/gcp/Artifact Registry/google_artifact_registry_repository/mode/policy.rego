package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.mode

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

# Merged `mode`-scoped policy. Each element of `conditions` is an independent
# scenario (situation) evaluated on its own by helpers.get_multi_summary:
#   1. approved_remote_upstreams        - REMOTE repos must use approved upstream URIs
#   2. remote_upstream_validation_required - REMOTE repos must not disable upstream validation
#   3. virtual_upstream_priority_range  - VIRTUAL repos must use an approved upstream priority range
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
                "https://australia-southeast1-docker.pkg.dev/*/*",
                [
                    ["trusted-project", "shared-artifacts"],
                    ["base-images", "approved-upstream"]
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ],
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
    ],
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
