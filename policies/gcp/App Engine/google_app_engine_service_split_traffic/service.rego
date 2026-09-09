package terraform.gcp.security.app_engine.google_app_engine_service_split_traffic.service

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_service_split_traffic.vars

conditions := [
  [
        {
            "situation_description": "Traffic splitting is applied to an unapproved service",
            "remedies": ["Set the service name to an approved value such as 'hardhat-main-api'"]
        },
        {
            "condition": "Check service against approved whitelist",
            "attribute_path": ["service"],
            "values": ["hardhat-main-api"],
            "policy_type": "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details