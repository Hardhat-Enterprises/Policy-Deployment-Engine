package terraform.gcp.security.discovery_engine.engine_schema.engine_schema_location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.engine_schema.vars

#engine_schema_location

conditions := [
    [
    {
        "situation_description": "Location is set to the wrong place",
        "remedies": ["Ensure Location is set to eu"]
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