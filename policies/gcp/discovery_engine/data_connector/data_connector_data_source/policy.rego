package terraform.gcp.security.discovery_engine.data_connector.data_connector_data_source
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.data_connector.vars

#Data_connector

conditions := [
    [
    {
        "situation_description": "Is the data connector set correctly",
        "remedies": ["Ensure that it is set to the correct source"]
        },
      {
        "condition": "data source is set to c-datasource",
        "attribute_path": ["data_source"],
        "values": ["c-datasource"],
        "policy_type": "whitelist"
      }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details