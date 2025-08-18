package terraform.gcp.security.discovery_engine.data_store.data_store_kms_key_name # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.discovery_engine.data_store.vars

#KMS_Key_Name

conditions := [
    [
    {
        "situation_description": "?",
        "remedies": [""]
        },
      {
        "condition": "KMS Key is mis-configured",
        "attribute_path": [""],
        "values": [false],
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