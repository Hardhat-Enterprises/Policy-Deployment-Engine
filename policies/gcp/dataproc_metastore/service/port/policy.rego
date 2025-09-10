package terraform.gcp.security.dataproc_metastore.service.port
import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc_metastore.service.vars

conditions := [
    [
        {
            "situation_description": "Metastore is not using the default port.",
            "remedies": ["Set port to 9083"]
        },
        {
            "condition": "Check if the metastore port is set to the default (9083).",
            "attribute_path": ["port"],
            "values": ["9083", "443"],
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