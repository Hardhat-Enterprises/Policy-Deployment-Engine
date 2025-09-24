package terraform.gcp.security.bigtable.google_bigtable_instance.display_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigtable.google_bigtable_instance.vars

conditions := [
    [
    {"situation_description" : "The Google Cloud Bigtable instance is missing a 'display_name' or has an empty display name. Display names are crucial for resource management, monitoring, and organizational governance. Without clear display names, it becomes difficult to identify resources in the console, troubleshoot issues, implement proper cost tracking, and maintain compliance with naming conventions. This can lead to operational confusion and increased management overhead.",
    "remedies":[  "Add a meaningful 'display_name' to the Bigtable instance resource.",
      "Follow organizational naming conventions for display names.",
      "Include environment, purpose, or team information in the display name for better resource identification.",
      "Ensure display names are descriptive and help with resource organization and cost allocation."]},
    {
        "condition": "Google Cloud Bigtable instance should have a meaningful display_name for proper resource identification and management.",
        "attribute_path" : ["display_name"], 
        "values" : ["", null], 
        "policy_type" : "blacklist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


