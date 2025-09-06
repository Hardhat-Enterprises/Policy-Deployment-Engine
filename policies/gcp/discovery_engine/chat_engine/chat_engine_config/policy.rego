package terraform.gcp.security.discovery_engine.chat_engine.chat_engine_config
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.chat_engine.vars

#allow_cross_region

conditions := [
    [
    {
        "situation_description": "Is allow_cross_region configured correctly",
        "remedies": ["Ensure that it is set to false"]
        },
      {
        "condition": "allow_cross_region is mis-configured",
        "attribute_path": ["chat_engine_config", 0, "allow_cross_region"],
        "values": [false],
        "policy_type": "whitelist"
      }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details