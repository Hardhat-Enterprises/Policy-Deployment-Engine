package terraform.gcp.security.discovery_engine.data_store.data_store_content_config # Edit here 
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

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details