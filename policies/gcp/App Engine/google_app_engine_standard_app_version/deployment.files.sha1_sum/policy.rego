package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.deployment_files_sha1_sum

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine deployment file supplies a blank integrity checksum",
            "remedies": ["provide a non-empty SHA1 checksum for the deployment file"]
        },
        {
            "condition": "Deployment file SHA1 checksum must be present and non-empty",
            "attribute_path": ["deployment", 0, "files", 0, "sha1_sum"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details