package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.json_params
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

#Data_connector_json

conditions := [
    [
    {
        "situation_description": "Is the data json set correctly",
        "remedies": ["Ensure that it is set to the correct json"]
        },
      {
        "condition": "data source is set to valid-string",
        "attribute_path": ["json_params"],
        "values": ["valid-string"],
        "policy_type": "whitelist"
      }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
