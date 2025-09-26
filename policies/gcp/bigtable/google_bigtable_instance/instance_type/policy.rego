package terraform.gcp.security.bigtable.google_bigtable_instance.instance_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigtable.google_bigtable_instance.vars

conditions := [
    [
    {"situation_description" : "The Google Cloud Bigtable instance is configured with 'DEVELOPMENT' instance type in a production environment. DEVELOPMENT instances have limited performance, no SLA guarantees, and are intended only for development and testing purposes. Using DEVELOPMENT instances for production workloads can lead to poor performance, data loss risks, and lack of support coverage. Production workloads should use 'PRODUCTION' instance type for guaranteed performance and SLA coverage.",
    "remedies":[  "Change the instance_type from 'DEVELOPMENT' to 'PRODUCTION' for production workloads.",
      "Review workload requirements to ensure appropriate instance type selection.",
      "Plan for capacity and performance requirements when migrating from DEVELOPMENT to PRODUCTION.",
      "Ensure proper monitoring and alerting are in place for production instances."]},
    {
        "condition": "Google Cloud Bigtable instance should use 'PRODUCTION' type for production workloads, not 'DEVELOPMENT'.",
        "attribute_path" : ["instance_type"], 
        "values" : ["DEVELOPMENT"], 
        "policy_type" : "blacklist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


