package terraform.gcp.security.oracle_db.exadata.patching_mode
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

conditions := [
    [
    {"situation_description" : "patching_mode  should be specified",
    "remedies":[ "Mention 'ROLLING' as the patching_mode"]},
    {
        "condition": "Mention 'ROLLING' as the patching_mode",
        "attribute_path" : ["properties",0,"maintenance_window",0,"patching_mode"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["ROLLING"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details