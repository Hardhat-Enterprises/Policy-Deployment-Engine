package terraform.gcp.security.managed_kafka.google_managed_kafka_acl.wildcard_principals 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_acl.vars


conditions := [
    [
    {"situation_description" :  "Wildcard principals (User:*) allow unrestricted access to Kafka resources and pose a security risk.",
    "remedies":[ "Use explicit principals instead of 'User:*'.",
                "Assign permissions only to specific Google service accounts."]},
    {
        "condition":  "Ensure that the principal is NOT set to a wildcard value ('User:*').",
        "attribute_path" :  ["acl_entries", 0, "principal"], 
        "values" : ["User:*"],
        "policy_type" : "blacklist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]
summary := {
    "message": helpers.get_multi_summary(conditions, vars.variables).message,
    "details": helpers.get_multi_summary(conditions, vars.variables).details
}

