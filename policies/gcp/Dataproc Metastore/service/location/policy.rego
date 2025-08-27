package terraform.gcp.security.dataproc_metastore.service.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc_metastore.service.vars

conditions := [
    [
        {
            "situation_description": "Location must be set to an approved value",
            "remedies": ["Use an approved location (global)."]
        },
        {
             "condition": "location is in the allow list",
             "attribute_path": ["location"],
             "values": ["global"],
             "policy_type": "whitelist"
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