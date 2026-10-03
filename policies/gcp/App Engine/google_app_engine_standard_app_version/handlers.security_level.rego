package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.handlers_security_level

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine handler does not enforce HTTPS",
            "remedies": ["set the handler 'security_level' attribute to 'SECURE_ALWAYS'"]
        },
        {
            "condition": "Require HTTPS for App Engine handlers",
            "attribute_path": ["handlers", "security_level"],
            "values": ["SECURE_ALWAYS"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details