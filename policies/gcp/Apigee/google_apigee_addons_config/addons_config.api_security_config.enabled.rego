package terraform.gcp.security.apigee.google_apigee_addons_config.addons_config_api_security_config_enabled
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_addons_config.vars
conditions := [
    [
        {
            "situation_description": "api_security_config must be enabled to ensure abuse detection and risk assessment are active",
            "remedies": [
                "Set addons_config.api_security_config.enabled to true to enable abuse detection, risk assessment, and security actions"
            ]
        },
        {
            "condition": "check api_security_config is enabled",
            "attribute_path": ["addons_config", 0, "api_security_config", 0, "enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
