package terraform.gcp.security.bigtable.google_bigtable_app_profile.routing_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigtable.google_bigtable_app_profile.vars

conditions := [
    [
    {"situation_description" : "The Google Cloud Bigtable app profile is configured without proper routing policy or with inappropriate routing configuration. App profiles control how requests are routed to clusters and can significantly impact performance, availability, and cost. Without proper routing policies, applications may experience poor performance, unnecessary cross-region traffic, or inability to implement proper disaster recovery strategies. Multi-cluster routing without appropriate configuration can also lead to data consistency issues.",
    "remedies":[  "Configure appropriate routing policy using either 'single_cluster_routing' or 'multi_cluster_routing_use_any' based on application requirements.",
      "For single cluster routing, specify the target cluster explicitly to ensure predictable performance.",
      "For multi-cluster routing, carefully consider consistency requirements and geographic distribution.",
      "Review application access patterns and latency requirements when choosing routing strategy.",
      "Implement proper testing for failover scenarios if using multi-cluster routing.",
      "Monitor routing effectiveness and adjust based on performance metrics."]},
    {
        "condition": "Google Cloud Bigtable app profile should have transactional writes enabled for better performance and consistency.",
        "attribute_path" : ["single_cluster_routing", 0, "allow_transactional_writes"], 
        "values" : [false], 
        "policy_type" : "blacklist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


