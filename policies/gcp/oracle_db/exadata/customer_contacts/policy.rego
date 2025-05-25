package terraform.gcp.security.oracle_db.exadata.customer_contacts
import data.terraform.gcp.helpers
import data.terraform.gcp.security.oracle_db.exadata.vars

conditions := [
    [
    {"situation_description" : "customer_contacts email should be specified",
    "remedies":[ "Mention the email id for the customer_contacts"]},
    {
        "condition": "Mention the email id for the customer_contacts",
        "attribute_path" : ["properties",0,"customer_contacts",0,"email"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["xyz@example.com"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details