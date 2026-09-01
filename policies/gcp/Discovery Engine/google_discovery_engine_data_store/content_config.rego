package terraform.gcp.security.discovery_engine.google_discovery_engine_data_store.content_config
import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_store.vars

#Data_store_config

conditions := [
    [
    {
        "situation_description": "Is Content config set to not be Public Website",
        "remedies": ["Ensure that it is set to anything but Public Website"]
        },
      {
        "condition": "Content Config is set to Public Website",
        "attribute_path": ["content_config"],
        "values": ["PUBLIC_WEBSITE"],
        "policy_type": "blacklist"
      }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
