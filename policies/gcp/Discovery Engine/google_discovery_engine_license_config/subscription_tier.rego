package terraform.gcp.security.discovery_engine.google_discovery_engine_license_config.subscription_tier
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_license_config.vars

#license_config_subscription_tier

conditions := [
    [
    {
        "situation_description": "Is license_config_subscription_tier configured correctly",
        "remedies": ["Ensure that it is set to SUBSCRIPTION_TIER_ENTERPRISE"]
        },
      {
        "condition": "license_config_subscription_tier is mis-configured",
        "attribute_path": ["subscription_tier"],
        "values": ["SUBSCRIPTION_TIER_ENTERPRISE"],
        "policy_type": "whitelist"
      }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
