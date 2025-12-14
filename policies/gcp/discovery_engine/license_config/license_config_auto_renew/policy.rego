package terraform.gcp.security.discovery_engine.license_config.license_config_auto_renew
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.license_config.vars

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


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details