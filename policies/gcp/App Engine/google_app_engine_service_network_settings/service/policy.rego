package terraform.gcp.security.app_engine.app_engine_service_network_settings.service

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.app_engine_service_network_settings.vars

conditions := [
    [
        {
            "situation_description": "App Engine service name does not follow the required naming convention",
            "remedies": ["Ensure to set the service name to an approved value, such as 'app-internal-service'"]
        },
        {
            "condition": "Check service naming against whitelist",
            "attribute_path": ["service"],
            "values": ["app-internal-service"], 
            "policy_type": "whitelist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details