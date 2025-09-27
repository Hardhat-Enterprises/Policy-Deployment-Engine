package terraform.gcp.security.bigtable.google_bigtable_gc_policy.max_age_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigtable.google_bigtable_gc_policy.vars

conditions := [
    [
    {"situation_description" : "The Google Cloud Bigtable garbage collection policy is configured without proper max_age settings or with extremely long retention periods. Without appropriate age-based garbage collection, tables can accumulate excessive amounts of historical data, leading to increased storage costs, reduced query performance, and potential compliance issues with data retention regulations. Proper garbage collection policies are essential for maintaining optimal performance and cost efficiency.",
    "remedies":[  "Configure appropriate max_age settings in the GC policy using either 'days' or 'duration' parameters.",
      "Review data retention requirements and compliance obligations to determine optimal retention periods.",
      "Consider business requirements for historical data access when setting max_age values.",
      "Monitor storage usage and performance impact after implementing GC policies.",
      "Implement regular reviews of GC policy effectiveness and adjust as needed."]},
    {
        "condition": "Google Cloud Bigtable GC policy should have appropriate max_age configuration for data lifecycle management.",
        "attribute_path" : ["max_age"], 
        "values" : [null, []], 
        "policy_type" : "blacklist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


