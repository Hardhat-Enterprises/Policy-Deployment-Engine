package terraform.gcp.security.certificate_authority.ca.issuer_path_length 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.ca.vars


conditions := [
    [
        {
            "situation_description" : "All Certificate Authorities should have a path length less than 4",
            "remedies":["Reduce the path length to 4"]
        },
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
    ],
    [
        {
            "situation_description" : "Subordinate Certifcate Authority should have a path length less than 2",
            "remedies":["Set type as subordinate certificate authority"]
        },
        {
            "condition": "Is a subordinate Certifcate Authority",
            "attribute_path" : ["type"], 
            "values" : ["SUBORDINATE"],
            "policy_type" : "blacklist" 
        },
        {
            "condition": "Path length is less than 2",
            "attribute_path" : ["config",0,"x509_config",0,"ca_options",0,"max_issuer_path_length"], 
            "values" : [null,6],
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