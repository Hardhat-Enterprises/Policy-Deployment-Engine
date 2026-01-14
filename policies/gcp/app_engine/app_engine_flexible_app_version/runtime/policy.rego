package terraform.gcp.security.app_engine.app_engine_flexible_app_version.runtime

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.app_engine_flexible_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine Flexible is using an unapproved/deprecated runtime",
            "remedies": ["Set 'runtime' to an approved value (e.g., 'nodejs', 'python', 'java')"]
        },
        {
            "condition": "Whitelist approved Flexible runtimes",
            "attribute_path": ["runtime"],
            "values": ["nodejs", "python", "java", "custom"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details