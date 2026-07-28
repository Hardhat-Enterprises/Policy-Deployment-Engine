package terraform.gcp.security.app_engine.google_app_engine_standard_app_version.instance_class

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_standard_app_version.vars

conditions := [
    # scenario 1:
    [
        {
            "situation_description": "The App Engine service name is not approved.",
            "remedies": ["Set 'service' to 'prod-web'."]
        },
        {
            "condition": "Whitelist service names",
            "attribute_path": ["service"],
            "values": ["prod-web"],
            "policy_type": "whitelist"
        }
    ],
    # scenario 2
    [
        {
            "situation_description": "The Instance Class is not approved.",
            "remedies": ["Set 'instance_class' to 'F1'."]
        },
        {
            "condition": "Whitelist instance classes",
            "attribute_path": ["instance_class"],
            "values": ["F1"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details