package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.libraries_version

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine library uses a floating 'latest' version",
            "remedies": ["set the library 'version' attribute to a specific pinned version instead of 'latest'"]
        },
        {
            "condition": "Disallow floating latest library versions",
            "attribute_path": ["libraries", "version"],
            "values": ["latest"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details