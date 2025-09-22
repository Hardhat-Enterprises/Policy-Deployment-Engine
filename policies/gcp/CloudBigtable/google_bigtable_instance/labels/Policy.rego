package terraform.gcp.security.cloud_platform_service.google_folder_iam_audit_config.audit_config
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_folder_iam_audit_config.vars

conditions := [
  # Policy 1 - ADMIN_READ for Cloud Bigtable
  [
    {"situation_description": "Audit logging must include ADMIN_READ for Cloud Bigtable",
     "remedies": ["Enable ADMIN_READ log for Cloud Bigtable"]},
    {
      "condition": "Must include ADMIN_READ",
      "attribute_path": ["audit_log_config",0,"log_type"],
      "values": ["ADMIN_READ"],
      "policy_type": "whitelist"
    }
  ],
  
  # Policy 2 - DATA_READ for Cloud Bigtable
  [
    {"situation_description": "Audit logging must include DATA_READ for Cloud Bigtable",
     "remedies": ["Enable DATA_READ log for Cloud Bigtable"]},
    {
      "condition": "Must include DATA_READ",
      "attribute_path": ["audit_log_config",1,"log_type"],
      "values": ["DATA_READ"],
      "policy_type": "whitelist"
    }
  ],

  # Policy 3 - DATA_WRITE for Cloud Bigtable
  [
    {"situation_description": "Audit logging must include DATA_WRITE for Cloud Bigtable",
     "remedies": ["Enable DATA_WRITE log for Cloud Bigtable"]},
    {
      "condition": "Must include DATA_WRITE",
      "attribute_path": ["audit_log_config",2,"log_type"],
      "values": ["DATA_WRITE"],
      "policy_type": "whitelist"
    }
  ],

  # Policy 4 - Admin access to Cloud Bigtable data
  [
    {"situation_description": "Admin access should be logged for Cloud Bigtable",
     "remedies": ["Enable ADMIN_READ log for admin access"]},
    {
      "condition": "Must include ADMIN_READ for admin access",
      "attribute_path": ["audit_log_config",0,"log_type"],
      "values": ["ADMIN_READ"],
      "policy_type": "whitelist"
    }
  ],

  # Policy 5 - Data change logging for Cloud Bigtable
  [
    {"situation_description": "Data change actions should be logged for Cloud Bigtable",
     "remedies": ["Enable DATA_WRITE log for data changes"]},
    {
      "condition": "Must include DATA_WRITE for data changes",
      "attribute_path": ["audit_log_config",2,"log_type"],
      "values": ["DATA_WRITE"],
      "policy_type": "whitelist"
    }
  ],

  # Policy 6 - Data read logging for Cloud Bigtable
  [
    {"situation_description": "Data read actions should be logged for Cloud Bigtable",
     "remedies": ["Enable DATA_READ log for data reads"]},
    {
      "condition": "Must include DATA_READ for data reads",
      "attribute_path": ["audit_log_config",1,"log_type"],
      "values": ["DATA_READ"],
      "policy_type": "whitelist"
    }
  ],

  # Policy 7 - Logging for changes in schema
  [
    {"situation_description": "Changes in schema must be logged for Cloud Bigtable",
     "remedies": ["Enable ADMIN_READ log for schema changes"]},
    {
      "condition": "Must include ADMIN_READ for schema changes",
      "attribute_path": ["audit_log_config",0,"log_type"],
      "values": ["ADMIN_READ"],
      "policy_type": "whitelist"
    }
  ],

  # Policy 8 - Log for data deletions in Cloud Bigtable
  [
    {"situation_description": "Data deletions should be logged for Cloud Bigtable",
     "remedies": ["Enable DATA_WRITE log for deletions"]},
    {
      "condition": "Must include DATA_WRITE for data deletions",
      "attribute_path": ["audit_log_config",2,"log_type"],
      "values": ["DATA_WRITE"],
      "policy_type": "whitelist"
    }
  ],

  # Policy 9 - Logging failed access attempts
  [
    {"situation_description": "Failed access attempts should be logged for Cloud Bigtable",
     "remedies": ["Enable ADMIN_READ log for failed attempts"]},
    {
      "condition": "Must include ADMIN_READ for failed access attempts",
      "attribute_path": ["audit_log_config",0,"log_type"],
      "values": ["ADMIN_READ"],
      "policy_type": "whitelist"
    }
  ],

  # Policy 10 - Logging for IAM changes to Cloud Bigtable
  [
    {"situation_description": "IAM changes must be logged for Cloud Bigtable",
     "remedies": ["Enable ADMIN_READ log for IAM changes"]},
    {
      "condition": "Must include ADMIN_READ for IAM changes",
      "attribute_path": ["audit_log_config",0,"log_type"],
      "values": ["ADMIN_READ"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
