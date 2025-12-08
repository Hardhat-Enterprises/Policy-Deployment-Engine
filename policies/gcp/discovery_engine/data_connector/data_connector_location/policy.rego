package terraform.gcp.security.discovery_engine.data_connector.data_connector_location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.data_connector.vars

#Data_connector

conditions := [
    [
    {
        "situation_description": "Is the location set correctly",
        "remedies": ["Ensure that it is set to the correct location"]
        },
      {
        "condition": "location is set to eu",
        "attribute_path": ["location"],
        "values": ["eu"],
        "policy_type": "whitelist"
      }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details