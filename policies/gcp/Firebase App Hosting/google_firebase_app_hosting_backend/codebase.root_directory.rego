package terraform.gcp.security.firebase_app_hosting.google_firebase_app_hosting_backend.codebase_root_directory

import data.terraform.helpers
import data.terraform.gcp.security.firebase_app_hosting.google_firebase_app_hosting_backend.vars

conditions := [
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
