package terraform.gcp.security.discovery_engine.cmek_config.cmek_config_location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.cmek_config.vars

#cmek_config_location


conditions := [
    [
    {
        "situation_description": "cmek_config_location key is set to the wrong location!!!",
        "remedies": ["Ensure that it is set to eu"]
        },
      {
        "condition": "Location is mis-configured",
        "attribute_path": ["location"],
        "values": ["eu"],
        "policy_type": "whitelist"
      }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details