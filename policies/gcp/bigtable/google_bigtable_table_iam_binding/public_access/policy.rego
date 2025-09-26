package terraform.gcp.security.bigtable.google_bigtable_table_iam_binding.public_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigtable.google_bigtable_table_iam_binding.vars

conditions := [
    [
    {"situation_description" : "The Google Cloud Bigtable table IAM binding is configured with public access by including 'allUsers' or 'allAuthenticatedUsers' as members. This creates a severe security risk by potentially exposing sensitive data to unauthorized individuals or the entire internet. Bigtable tables often contain critical business data, personal information, or confidential records that should never be accessible to the public. Public access violates data protection principles and may result in compliance violations, data breaches, and regulatory penalties.",
    "remedies":[  "Remove 'allUsers' and 'allAuthenticatedUsers' from the members list in the IAM binding.",
      "Replace public access with specific user accounts, service accounts, or groups that require access.",
      "Implement proper authentication and authorization mechanisms for legitimate users.",
      "Review data classification and ensure appropriate access controls are in place.",
      "Conduct security audit to identify any unauthorized access or data exposure.",
      "Consider using VPC Service Controls for additional network-level protection."]},
    {
        "condition": "Google Cloud Bigtable table IAM binding should not grant public access through 'allUsers' or 'allAuthenticatedUsers'.",
        "attribute_path" : ["members"], 
        "values" : ["allUsers", "allAuthenticatedUsers"], 
        "policy_type" : "blacklist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


