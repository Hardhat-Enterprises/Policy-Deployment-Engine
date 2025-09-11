package terraform.gcp.security.discovery_engine.engine_schema.engine_schema_json
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.engine_schema.vars

#engine_schema_json

conditions := [
    [
    {
        "situation_description": "Json is not set up correctly",
        "remedies": ["Ensure The Json is set up correctly according to rules"]
        },
      {
      #And Block
        "condition": "Json is mis-configured",
        "attribute_path": ["json_schema"],
        "values": ["*", ["{\"$schema\":\"https://google/cschema\"}"]],
        "policy_type": "pattern whitelist"
      }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details