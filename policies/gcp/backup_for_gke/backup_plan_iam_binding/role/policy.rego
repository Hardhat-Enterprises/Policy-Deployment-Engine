package terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.role
import data.terraform.helpers
import data.terraform.gcp.security.backup_for_gke.backup_plan_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Backup Plan IAM role must not be basic or highly privileged.",
      "remedies": ["Use least privilege roles (avoid owner, editor, securityAdmin)."]
    },
    {
      "condition": "Role must not be owner, editor, securityAdmin, or serviceAccountUser",
      "attribute_path": ["role"],
      "values": [
        "roles/owner", 
        "roles/editor", 
        "roles/iam.securityAdmin", 
        "roles/resourcemanager.organizationAdmin",
        "roles/iam.serviceAccountUser", # Privilege escalation vector
        "roles/backupDR.admin" # Too permissive
      ],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
