package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.deployment_zip_source_url

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine deployment archive uses an insecure source URL",
            "remedies": ["use an HTTPS source URL for the deployment archive"]
        },
        {
            "condition": "Deployment archive source URL must not use HTTP",
            "attribute_path": ["deployment", 0, "zip", 0, "source_url"],
            "values": ["*://*", [["http"]]],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details