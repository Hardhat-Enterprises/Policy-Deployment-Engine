package terraform.gcp.security.apigee.google_apigee_addons_config.addons_config_advanced_api_ops_config_enabled
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_addons_config.vars
conditions := [
    [
        {
            "situation_description": "advanced_api_ops_config must be enabled to ensure anomaly detection and advanced security alerting are active",
            "remedies": [
                "Set addons_config.advanced_api_ops_config.enabled to true to enable anomaly detection and advanced security alerting"
            ]
        },
        {
            "condition": "check advanced_api_ops_config is enabled",
            "attribute_path": ["addons_config", 0, "advanced_api_ops_config", 0, "enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
