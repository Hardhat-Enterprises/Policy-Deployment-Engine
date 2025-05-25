package terraform.gcp.security.oracle_db.exadata.oracle_zone
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

conditions := [
    [
    {"situation_description" : "Restrict Oracle Exadata deployments to approved GCP zones only",
    "remedies":[ "Use gcp_oracle_zone values like australia-southeast1-a"]},
    {
        "condition": "gcp_oracle_zone must be in approved list",
        "attribute_path" : ["gcp_oracle_zone"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["australia-southeast1-a"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details