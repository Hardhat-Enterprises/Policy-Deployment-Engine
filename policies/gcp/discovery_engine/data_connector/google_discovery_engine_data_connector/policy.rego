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
    ],
    [
    {
        "situation_description": "Is the static_ip_enabled set correctly",
        "remedies": ["Ensure that it is set to the correct static_ip_enabled"]
        },
      {
        "condition": "static_ip_enabled is misconfigured",
        "attribute_path": ["params", 0, "static_ip_enabled"],
        "values": ["false"],
        "policy_type": "whitelist"
      }
    ],
    [
    {
        "situation_description": "Is the client_id set correctly",
        "remedies": ["Ensure that it is set to the correct client_id"]
        },
      {
        "condition": "client_id is misconfigured",
        "attribute_path": ["params", 0, "client_id"],
        "values": ["VALID-ID"],
        "policy_type": "whitelist"
      }
    ],
    [
    {
        "situation_description": "Is the user_account set correctly",
        "remedies": ["Ensure that it is set to the correct user_account"]
        },
      {
        "condition": "parms is misconfigured",
        "attribute_path": ["params", 0, "user_account"],
        "values": ["Validuser@google.com"],
        "policy_type": "whitelist"
      }
    ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details