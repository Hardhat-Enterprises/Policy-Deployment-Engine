package terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.deployment_zip_source_url

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine application code is being deployed from an unauthorized source URL",
            "remedies": ["Set 'deployment.zip.source_url' to an authorized GCS URL"]
        },
        {
            "condition": "Match against exact approved deployment URLs",
            "attribute_path": ["deployment", 0, "zip", 0, "source_url"],
            "values": ["https://storage.googleapis.com/hardhat-bucket/hello-world.zip"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details