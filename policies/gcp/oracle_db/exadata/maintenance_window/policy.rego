package terraform.gcp.security.oracle_db.exadata.maintenance_window
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

conditions := [
    [
    {"situation_description" : "maintenance_window preference should be specified",
    "remedies":[ "Mention CUSTOM_PREFERENCE for the maintenance_window"]},
    {
        "condition": "Mention CUSTOM_PREFERENCE for the maintenance_window",
        "attribute_path" : ["properties",0,"maintenance_window",0,"preference"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["CUSTOM_PREFERENCE"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details