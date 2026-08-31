package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.data_source
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

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
        "values": ["c-datasource", "salesforce", "jira", "confluence", "bigquery"],
        "policy_type": "whitelist"
      }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
