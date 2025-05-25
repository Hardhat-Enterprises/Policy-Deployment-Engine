package terraform.gcp.security.oracle_db.exadata.labels
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

conditions := [
    [
    {"situation_description" : "Ensure 'env' label is present",
    "remedies":[ "Add 'env' label for environment tracking"]},
    {
        "condition": "env label required",
        "attribute_path" : ["labels","env"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["prod"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ],

    [
    {"situation_description" : "Ensure 'owner' label is present",
    "remedies":[ "Add 'owner' label for environment tracking"]},
    {
        "condition": "owner label required",
        "attribute_path" : ["labels","owner"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["dev_team_1"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details