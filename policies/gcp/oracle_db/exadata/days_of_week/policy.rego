package terraform.gcp.security.oracle_db.exadata.days_of_week
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

conditions := [
    [
    {"situation_description" : "Restrict maintenance to weekdays only",
    "remedies":[ "Set days_of_week to MONDAY through FRIDAY"]},
    {
        "condition": "maintenance allowed only on weekdays",
        "attribute_path" : ["properties",0,"maintenance_window",0,"days_of_week",0], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details