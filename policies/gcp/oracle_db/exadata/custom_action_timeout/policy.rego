package terraform.gcp.security.oracle_db.exadata.custom_action_timeout
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

conditions := [
    [
    {"situation_description" : "Ensure patching includes a timeout for pre-patch security handling",
    "remedies":[ "Set is_custom_action_timeout_enabled to true"]},
    {
        "condition": "custom action timeout must be enabled",
        "attribute_path" : ["properties",0,"maintenance_window",0,"is_custom_action_timeout_enabled"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : [true], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details