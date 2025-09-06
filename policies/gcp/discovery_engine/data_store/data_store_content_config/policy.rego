package terraform.gcp.security.discovery_engine.data_store.data_store_content_config 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.data_store.vars

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

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details