package terraform.gcp.security.oracle_db.exadata.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

conditions := [
    [
    {"situation_description" : "Prevent terraform from using location outside Australia",
    "remedies":[ "Use regions in Australia"]},
    {
        "condition": "Use regions in Australia",
        "attribute_path" : ["location"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["australia-southeast1", "australia-southeast2"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details