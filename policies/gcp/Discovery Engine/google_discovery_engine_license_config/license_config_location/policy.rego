package terraform.gcp.security.discovery_engine.license_config.license_config_location
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.license_config.vars

#license_config_location

conditions := [
    [
    {
        "situation_description": "Is license_config_location configured correctly",
        "remedies": ["Ensure that it is set to a valid location"]
        },
      {
        "condition": "license_config_location is mis-configured",
        "attribute_path": ["location"],
        "values": ["eu", "us", "global"],
        "policy_type": "whitelist"
      }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details