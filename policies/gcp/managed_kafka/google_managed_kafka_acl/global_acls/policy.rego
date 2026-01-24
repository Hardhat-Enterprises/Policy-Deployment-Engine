package terraform.gcp.security.managed_kafka.google_managed_kafka_acl.global_acls
import data.terraform.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_acl.vars

conditions := [
     [
        {"situation_description": "Global ACLs like allTopics or allConsumerGroups may lead to uncontrolled access.",
         "remedies": ["Grant topic-level or consumerGroup-level ACLs instead of global permissions."]},
        {
            "condition": "Do not allow global ACLs when granting ALL permissions",
            "attribute_path": ["acl_id"],
            "values": ["allTopics", "allConsumerGroups"],
            "policy_type": "blacklist"
        }
    ]

]
    

summary := {
    "message": helpers.get_multi_summary(conditions, vars.variables).message,
    "details": helpers.get_multi_summary(conditions, vars.variables).details
}
