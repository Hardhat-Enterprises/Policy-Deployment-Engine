package terraform.gcp.security.discovery_engine.engine_schema.engine_schema_json # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.engine_schema.vars

#engine_schema_location

#And Block, If it only triggers one then its compliant, if both triggered, its not compliant
#OR block, If one condition is triggered, the whole thing fails. under conditions[square brackets]

conditions := [
#Situation (OR Block)
    [
    {
        "situation_description": "Json is not set up correctly",
        "remedies": ["Ensure The Json is set up correctly according to rules"]
        },
      {
      #And Block
        "condition": "Json is mis-configured",
        "attribute_path": ["json_schema"],
        "values": ["{\"$schema\":\"https://google.com\"}"],
        "policy_type": "whitelist"
      },
      #Comma needed
      {
      #And Block
        "condition": "Json is mis-configured",
        "attribute_path": ["location"],
        "values": ["eu"],
        "policy_type": "whitelist"
      }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details