package terraform.gcp.security.discovery_engine.google_discovery_engine_license_config.auto_renew
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_license_config.vars

#license_config_auto_renew

conditions := [
    [
    {
        "situation_description": "Is license_config_auto_renew configured correctly",
        "remedies": ["Ensure that it is set to false"]
        },
      {
        "condition": "license_config_auto_renew is mis-configured",
        "attribute_path": ["auto_renew"],
        "values": [false],
        "policy_type": "whitelist"
      }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
