package terraform.gcp.security.app_engine.app_engine_standard_app_version.runtime

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.app_engine_standard_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine Standard runtime is using an unapproved/deprecated language version",
            "remedies": ["set the 'runtime' attribute to an approved version  (e.g. 'nodejs20', 'python311' or 'java17')"]
        },
        {
            "condition": "Whitelist approved Standard runtimes",
            "attribute_path": ["runtime"],
            "values": ["nodejs20", "python311", "java17"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details