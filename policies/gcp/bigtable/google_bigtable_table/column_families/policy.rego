package terraform.gcp.security.bigtable.google_bigtable_table.column_families

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigtable.google_bigtable_table.vars

conditions := [
    [
    {"situation_description" : "The Google Cloud Bigtable table is configured without any column families defined. Column families are essential for organizing data structure, implementing access controls, and defining data retention policies. Tables without properly configured column families may lead to poor data organization, inefficient queries, lack of granular access control, and difficulties in implementing appropriate garbage collection policies for data lifecycle management.",
    "remedies":[  "Define at least one column family for the Bigtable table using the 'column_family' block.",
      "Plan column family structure based on data access patterns and query requirements.",
      "Configure appropriate garbage collection policies for each column family.",
      "Follow Bigtable best practices for column family design and naming conventions."]},
    {
        "condition": "Google Cloud Bigtable table should have at least one column family defined for proper data organization.",
        "attribute_path" : ["column_family"], 
        "values" : [null, []], 
        "policy_type" : "blacklist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


