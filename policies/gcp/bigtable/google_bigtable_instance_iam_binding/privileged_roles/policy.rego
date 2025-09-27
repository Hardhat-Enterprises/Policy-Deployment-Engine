package terraform.gcp.security.bigtable.google_bigtable_instance_iam_binding.privileged_roles

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigtable.google_bigtable_instance_iam_binding.vars

conditions := [
    [
    {"situation_description" : "The Google Cloud Bigtable instance IAM binding is configured with overly privileged roles such as 'roles/owner', 'roles/editor', or 'roles/bigtable.admin'. These roles provide broad administrative access that violates the principle of least privilege. Excessive permissions increase the risk of unauthorized data access, accidental modifications, compliance violations, and potential security breaches. Users should be granted only the minimum permissions necessary for their specific job functions.",
    "remedies":[  "Replace overly privileged roles with more specific, least-privilege roles such as 'roles/bigtable.reader' or 'roles/bigtable.user'.",
      "Review user access requirements and map them to appropriate Bigtable-specific roles.",
      "Implement regular access reviews to ensure permissions remain appropriate over time.",
      "Use custom roles if predefined roles don't match exact requirements.",
      "Consider using IAM conditions for more granular access control."]},
    {
        "condition": "Google Cloud Bigtable instance IAM binding should not use overly privileged roles that violate least privilege principle.",
        "attribute_path" : ["role"], 
        "values" : ["roles/owner", "roles/editor", "roles/bigtable.admin"], 
        "policy_type" : "blacklist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


