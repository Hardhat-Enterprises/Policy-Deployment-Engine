package terraform.gcp.security.oracle_db.exadata.deletion_protection
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

conditions := [
    [
    {"situation_description" : "Prevent terraform from deleting the cluster",
    "remedies":[ "Enable deletion_protection"]},
    {
        "condition": "enable deletion_protection",
        "attribute_path" : ["deletion_protection"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [true], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details