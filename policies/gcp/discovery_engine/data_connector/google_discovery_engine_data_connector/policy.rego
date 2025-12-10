package terraform.gcp.security.discovery_engine.data_connector.google_discovery_engine_data_connector
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.data_connector.vars

#Data_connector

conditions := [
    [
    {
        "situation_description": "Is the data prams set correctly",
        "remedies": ["Ensure that it is set to the correct paramiters"]
        },
      {
        "condition": "parms is misconfigured",
        "attribute_path": ["params",0, "auth_type"],
        "values": ["OAUTH_PASSWORD_GRANT"],
        "policy_type": "whitelist"
      }
    ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details