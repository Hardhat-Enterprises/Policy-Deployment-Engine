package terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.spec_service_account

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.vars

conditions := [
    [
        {
            "situation_description": "The Reasoning Engine does not set a dedicated service account.",
            "remedies": [
                "Set 'spec.service_account' to name@project.iam.gserviceaccount.com"
            ]
        },
        {
            "condition": "service_account must not be empty or invalid",
            "attribute_path": ["spec", 0, "service_account"],
            "values": [null, "", "invalid-service-account"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "The Reasoning Engine service account must be a valid Google service account.",
            "remedies": [
                "Use format: name@project.iam.gserviceaccount.com"
            ]
        },
        {
            "condition": "service_account must follow the service account pattern",
            "attribute_path": ["spec", 0, "service_account"],
            "values": [
                "*@*.iam.gserviceaccount.com",
                [
                    ["example-engine", "reasoning-engine", "vertex-sa"],
                    ["example-project", "project-1", "project-2"]
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
