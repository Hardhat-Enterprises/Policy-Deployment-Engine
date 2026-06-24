package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.deployment_zip_source_url

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine Standard application code is being deployed via an unauthorized source URL",
            "remedies": ["Ensure to set 'deployment.zip.source_url' to the authorized GCS URL"]
        },
        {
            "condition": "Match against exact approved deployment URLs",
            "attribute_path": ["deployment", 0, "zip", 0, "source_url"],
            "values": ["https://storage.googleapis.com/appengine-static-content/hello-world.zip"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details