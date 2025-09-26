package terraform.gcp.security.bigtable.google_bigtable_table.deletion_protection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigtable.google_bigtable_table.vars

conditions := [
    [
    {"situation_description" : "The Google Cloud Bigtable table lacks proper deletion protection mechanisms. Tables should have either 'deletion_protection' enabled OR 'lifecycle.prevent_destroy' configured to prevent accidental data loss. Without these safeguards, tables containing critical business data are vulnerable to accidental deletion through API calls, console operations, or automated scripts.",
    "remedies":[  
        "Enable deletion_protection by setting 'deletion_protection = true' for the Bigtable table resource, OR",
        "Add 'lifecycle { prevent_destroy = true }' to the table resource configuration (recommended by Google)",
        "Implement proper backup strategies before modifying deletion protection settings",
        "Review IAM permissions to ensure only authorized personnel can modify table deletion settings",
        "Establish change management procedures for table lifecycle operations"
    ]},
    {
        "condition": "Google Cloud Bigtable table should have deletion protection enabled when the attribute is explicitly set to false",
        "attribute_path" : ["deletion_protection"], 
        "values" : [false], 
        "policy_type" : "blacklist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


