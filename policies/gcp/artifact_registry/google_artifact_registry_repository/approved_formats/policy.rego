package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.approved_formats

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

conditions := [
    [
        {
            "situation_description": "Artifact Registry repositories should use only approved package formats.",
            "remedies": [
                "Set format to one of the allowed values such as DOCKER, MAVEN, NPM, or PYTHON."
            ]
        },
        {
            "condition": "format must be an approved value",
            "attribute_path": ["format"],
            "values": [
                "DOCKER",
                "MAVEN",
                "NPM",
                "PYTHON"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

