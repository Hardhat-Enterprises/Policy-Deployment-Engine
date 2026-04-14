package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.approved_modes

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

conditions := [
    [
        {
            "situation_description": "Artifact Registry repositories should use only approved repository modes.",
            "remedies": [
                "Set mode to one of the allowed values: STANDARD_REPOSITORY, REMOTE_REPOSITORY, or VIRTUAL_REPOSITORY."
            ]
        },
        {
            "condition": "mode must be an approved value",
            "attribute_path": ["mode"],
            "values": [
                "STANDARD_REPOSITORY",
                "REMOTE_REPOSITORY",
                "VIRTUAL_REPOSITORY"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details