package terraform.gcp.security.discovery_engine.cmek_config.cmek_config_kms_key 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.cmek_config.vars

#cmek_config

#Note there is an issue somewhere in the detection of nc and c
conditions := [
    [
    {
        "situation_description": "cmek_config key end is set to the wrong id!!!",
        "remedies": ["Ensure that it is set to our key"]
        },
      {
        "condition": "allow_cross_region is mis-configured",
        "attribute_path": ["kms_key"],
        "values": ["*-*-*", [["my"],["crypto"],["key"]]],
        "policy_type": "pattern whitelist"
      }
    ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details