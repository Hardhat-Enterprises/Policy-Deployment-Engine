package terraform.gcp.security.oracle_db.exadata.hours_of_day
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

conditions := [
    [
    {"situation_description" : "Restrict maintenance to overnight hours",
    "remedies":["Set hours_of_day to time slots like 0 or 4"]},
    {
        "condition": "maintenance only allowed during safe hours",
        "attribute_path" : ["properties",0,"maintenance_window",0,"hours_of_day",0], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [0, 4], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details