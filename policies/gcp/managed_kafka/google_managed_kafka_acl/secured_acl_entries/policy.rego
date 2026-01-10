package terraform.gcp.security.managed_kafka.google_managed_kafka_acl.secured_acl_entries
import data.terraform.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_acl.vars

conditions := [
    [
    {"situation_description" : "The Kafka ACL permission type must be set to ALLOW to ensure only authorized principals can perform operations on Kafka topics and resources.",
    "remedies":[ "Update the ACL entry to set 'permission_type' to 'ALLOW'.",
                "Ensure that no ACL entries are configured with 'DENY' unless explicitly required for security purposes.",
                "Review Kafka ACL configurations to verify that authorized service accounts have proper access permissions."]},
    {
        "condition": "Validate that the ACL entry permission_type is set to ALLOW",
        "attribute_path" : ["acl_entries",0,"permission_type"], 
        "values" : ["ALLOW"], 
        "policy_type" : "whitelist"
    }
    ]
]
summary := {
    "message": helpers.get_multi_summary(conditions, vars.variables).message,
    "details": helpers.get_multi_summary(conditions, vars.variables).details
}