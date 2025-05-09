package terraform.gcp.security.certificate_authority.ca.type_root 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.ca.vars

# No type check required as SELF_SIGNED (Root) is the default
conditions := [
    [
    {"situation_description" : "Root Certificate Authority with a path length less than 4",
    "remedies":["Reduce the path length to 4"]},
    {
        "condition": "Path length is less than 4",
        "attribute_path" : ["config",0,"x509_config",0,"ca_options",0,"max_issuer_path_length"], 
        "values" : [null,4],
        "policy_type" : "range" 
    },
    {
        "condition": "Zero issuer path length is set to true",
        "attribute_path" : ["config",0,"x509_config",0,"ca_options",0,"zero_max_issuer_path_length"], 
        "values" : [true], 
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details