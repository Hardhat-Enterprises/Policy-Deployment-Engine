package terraform.gcp.security.discovery_engine.chat_engine.chat_engine_location # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.chat_engine.vars

#location check

conditions := [
    [
    {
        "situation_description": "Is location set to eu?",
        "remedies": ["Ensure that it is set to eu"]
        },
      {
        "condition": "location is mis-configured",
        "attribute_path": ["location"],
        "values": ["eu"],
        "policy_type": "whitelist"
      }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details