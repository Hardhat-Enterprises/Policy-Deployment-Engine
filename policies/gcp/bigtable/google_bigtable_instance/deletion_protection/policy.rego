package terraform.gcp.security.bigtable.google_bigtable_instance.deletion_protection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigtable.google_bigtable_instance.vars

conditions := [
    [
    {"situation_description" : "The Google Cloud Bigtable instance is configured without 'deletion_protection' enabled or is explicitly set to 'false'. This creates a significant risk of accidental data loss, as the instance and all its data can be deleted without proper safeguards. Bigtable instances often contain critical business data, and enabling deletion protection is essential for preventing catastrophic data loss from human error or unauthorized operations.",
    "remedies":[  "Enable deletion_protection by setting 'deletion_protection = true' for the Bigtable instance resource.",
      "Review organizational change management procedures to ensure proper approval processes for disabling deletion protection.",
      "Implement backup strategies and data retention policies before making any deletion protection changes.",
      "Consider using IAM policies to restrict who can modify deletion protection settings."]},
    {
        "condition": "Google Cloud Bigtable instance should have 'deletion_protection' enabled to prevent accidental deletion of critical data.",
        "attribute_path" : ["deletion_protection"], 
        "values" : [true], 
        "policy_type" : "whitelist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


