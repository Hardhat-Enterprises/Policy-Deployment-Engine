package terraform.gcp.security.bigtable.google_bigtable_backup_iam_binding.backup_access_control

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigtable.google_bigtable_backup_iam_binding.vars

conditions := [
    [
    {"situation_description" : "The Google Cloud Bigtable backup IAM binding is configured with overly broad permissions or includes public access members. Backup data often contains the same sensitive information as production data and requires strict access controls to prevent unauthorized access, data exfiltration, or compromise of backup integrity. Improper backup access controls can lead to data breaches, compliance violations, and inability to recover from disasters due to compromised backup data.",
    "remedies":[  "Ensure backup IAM bindings use least-privilege roles such as 'roles/bigtable.reader' instead of administrative roles.",
      "Remove any public access members ('allUsers', 'allAuthenticatedUsers') from backup IAM bindings.",
      "Limit backup access to specific service accounts and authorized personnel only.",
      "Implement regular reviews of backup access permissions.",
      "Consider using customer-managed encryption keys (CMEK) for additional backup security.",
      "Establish proper backup retention and deletion policies."]},
    {
        "condition": "Google Cloud Bigtable backup IAM binding should not grant public access and should use appropriate backup-specific roles.",
        "attribute_path" : ["members"], 
        "values" : ["allUsers", "allAuthenticatedUsers"], 
        "policy_type" : "blacklist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details


