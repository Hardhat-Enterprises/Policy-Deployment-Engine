package terraform.gcp.security.oracle_db.exadata.shape
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

conditions := [
    [
    {"situation_description" : "Exadata shape should be specified",
    "remedies":[ "Mention exadata-x9m as the shape"]},
    {
        "condition": "Mention exadata-x9m as the shape",
        "attribute_path" : ["properties",0,"shape"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["exadata-x9m"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details