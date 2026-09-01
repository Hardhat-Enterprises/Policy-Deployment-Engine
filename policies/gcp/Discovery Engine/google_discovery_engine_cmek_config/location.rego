package terraform.gcp.security.discovery_engine.google_discovery_engine_cmek_config.location
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_cmek_config.vars

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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
