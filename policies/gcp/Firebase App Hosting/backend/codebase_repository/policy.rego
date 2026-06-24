package terraform.gcp.security.firebase_app_hosting.backend.codebase_repository

import data.terraform.helpers
import data.terraform.gcp.security.firebase_app_hosting.backend.vars

conditions := [
    [
        {
            "situation_description": "Codebase repository is using insecure or unauthorized project locations",
            "remedies": [
                "Use approved Google Cloud regions only",
                "Ensure repository connections are in regions that comply with data residency requirements",
                "Avoid using deprecated or insecure regions"
            ]
        },
        {
            "condition": "Repository should be in approved locations",
            "attribute_path": ["codebase", 0, "repository"],
            "values": [
                "projects/*/locations/{australia-southeast1-a,australia-southeast1-b,australia-southeast1-c,australia-southeast2,australia-southeast2-a,australia-southeast2-b,australia-southeast2-c}/connections/*/gitRepositoryLinks/*"
            ],
            "policy_type": "pattern whitelist"
        }
    ],
    [
        {
            "situation_description": "Codebase repository root directory may expose sensitive files or configurations",
            "remedies": [
                "Set root_directory to a specific application folder",
                "Avoid using root directory '/' or empty values",
                "Use subdirectories like 'app/', 'src/', or 'web/' to limit exposure"
            ]
        },
        {
            "condition": "Root directory should not be empty or root path",
            "attribute_path": ["codebase", 0, "root_directory"],
            "values": ["", "/", ".", "./"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details